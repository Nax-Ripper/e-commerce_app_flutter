import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';
import 'package:e_commerce/screens_Admin/services/database_service.dart';
import 'package:e_commerce/screens_Admin/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens_Admin/controllers/product_Controller.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

  // Get.find() is for already created instance for Get.create
  final ProductController _productController = Get.find();
  final StorageService _storageService = StorageService();
  final ImagePicker _picker = ImagePicker();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add a Product",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      // appBar: AppBar(title: const Text("Add a Product"),),
      backgroundColor: kPrimaryColor,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                final XFile? _image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                print(_image!.path);

                                if (_image != null) {
                                  await _storageService.uploadImage(_image);
                                  var imageUrl = await _storageService
                                      .getDownloadURL(_image.name);
                                  _productController.newProduct.update(
                                      "imageUrl", (_) => imageUrl,
                                      ifAbsent: (() => imageUrl));
                                  print("Image is selected");
                                  print(_productController
                                      .newProduct["imageUrl"]);
                                }

                                if (_image == null) {
                                  Fluttertoast.showToast(
                                      msg: "No image was selected");
                                }
                              },
                              icon: const Icon(
                                Icons.add_box,
                                color: kPrimaryColor,
                              )),
                          const Text(
                            "Add an Image",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Product Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildTextFormField(
                    hinText: "Product ID",
                    name: "id",
                    pController: _productController),
                _buildTextFormField(
                    hinText: "Product Name",
                    name: "name",
                    pController: _productController),
                _buildTextFormField(
                    hinText: "Product Description",
                    name: "description",
                    pController: _productController),
                _buildTextFormField(
                    hinText: "Product Category",
                    name: "category",
                    pController: _productController),
                const SizedBox(height: 20),
                _BuildSlider(
                  title: "Price",
                  pContoller: _productController,
                  controllerValue: _productController.price,
                  name: 'price',
                ),
                _BuildSlider(
                    title: "Quantity",
                    name: "quantity",
                    pContoller: _productController,
                    controllerValue: _productController.quantity),
                const SizedBox(
                  height: 10,
                ),
                _buildCheckBox(
                    title: "Recomended",
                    name: "isRecomended",
                    pContoller: _productController,
                    controllerValue: _productController.isRecomended),
                _buildCheckBox(
                    title: "Popular",
                    name: "isPopular",
                    pContoller: _productController,
                    controllerValue: _productController.isPopular),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        print(_productController.newProduct);
                        String quantityStr = _productController
                            .newProduct["quantity"]
                            .toString();
                        print(quantityStr);
                        double quantity = double.parse(quantityStr);
                        print(quantity.truncate());
                        await database.addProduct(
                          AdminProduct(
                              description:
                                  _productController.newProduct["description"],
                              id: int.parse(
                                  _productController.newProduct["id"]),
                              name: _productController.newProduct["name"],
                              category:
                                  _productController.newProduct["category"],
                              imageUrl:
                                  _productController.newProduct["imageUrl"],
                              isRecomended:
                                  _productController.newProduct["isRecomended"],
                              isPopular:
                                  _productController.newProduct["isPopular"],
                              price: double.parse(_productController
                                  .newProduct["price"]
                                  .toString()),
                              quantity: quantity.toInt()
                              // quantity: int.parse(_productController.newProduct["quantity"].toString()),
                              ),
                        );
                      } catch (e) {
                        Fluttertoast.showToast(msg: "Upload Unsuccessful");
                      }

                      Fluttertoast.showToast(
                          msg: "Product uploaded Successfully");
                    },
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _buildTextFormField(
      {required String hinText,
      required String name,
      required ProductController pController}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hinText,
          ),
          onChanged: (value) {
            pController.newProduct
                .update(name, (_) => value, ifAbsent: (() => value));
          },
        ),
      ),
    );
  }
}

class _BuildSlider extends StatelessWidget {
  final String title;
  final String name;
  final ProductController pContoller;
  double? controllerValue;
  _BuildSlider({
    Key? key,
    required this.title,
    required this.name,
    required this.pContoller,
    this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      Expanded(
        child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue!,
            min: 0,
            max: 50,
            divisions: 10,
            thumbColor: Colors.black,
            activeColor: Colors.orange[900],
            inactiveColor: Colors.amber,
            onChanged: (value) {
              pContoller.newProduct
                  .update(name, (_) => value, ifAbsent: (() => value));
            }),
      ),
    ]);
  }
}

_buildCheckBox(
    {required String title,
    required String name,
    required ProductController pContoller,
    bool? controllerValue}) {
  return Row(children: [
    SizedBox(
      width: 125,
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
      ),
    ),
    Checkbox(
      value: (controllerValue == null) ? false : controllerValue,
      onChanged: (value) {
        pContoller.newProduct
            .update(name, (_) => value, ifAbsent: (() => value));
      },
    ),
  ]);
}
