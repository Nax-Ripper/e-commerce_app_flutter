// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widget/defaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (emailValue) {
                if (_formKey.currentState!.validate()) {
                  email = emailValue!;
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                  // setState(() {
                  //   errors.add(kEmailNullError);
                  // });
                  return kEmailNullError;
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError)) {
                  // setState(() {
                  //   errors.add(kInvalidEmailError);
                  // });
                  return kInvalidEmailError;
                }
                return null;
              },
              decoration:
                  inputDeco("Email", "Enter your email", Icon(Icons.mail)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (passValue) {
                if (_formKey.currentState!.validate()) {
                  password = passValue!;
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kPassNullError)) {
                  setState(() {
                    errors.remove(kPassNullError);
                  });
                } else if (value.length >= 8 &&
                    errors.contains(kShortPassError)) {
                  setState(() {
                    errors.remove(kShortPassError);
                  });
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kPassNullError)) {
                  // setState(() {
                  //   errors.add(kPassNullError);
                  // });
                  return kPassNullError;
                } else if (value.length < 8 &&
                    !errors.contains(kShortPassError)) {
                  // setState(() {
                  //   errors.add(kShortPassError);
                  // });
                  return kShortPassError;
                }
                return null;
              },
              decoration:
                  inputDeco("Password", "Enter your password", Icon(Icons.key)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text(
                  "Remember me",
                  style: TextStyle(fontSize: 17),
                ),
                Spacer(),
                Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(errors: errors),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  // _formKey.currentState!.save();
                  print(_formKey.currentState!.validate());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Welcome User"),
                    elevation: 10,
                  ));
                  Get.back(closeOverlays: true);
                  Get.to(HomeScreen());

                  // print(email);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(errors.length, (index) => formErrorText(errors[index])),
    );
  }
}

Row formErrorText(String errorText) {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/icons/Error.svg',
        height: getProportionateScreenHeight(14),
        width: getProportionateScreenWidth(14),
      ),
      SizedBox(
        width: getProportionateScreenWidth(10),
      ),
      Text(errorText),
    ],
  );
}

InputDecoration inputDeco(String label, String hint, Icon icons) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: icons,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    ),
  );
}
