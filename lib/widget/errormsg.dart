import 'package:flutter/material.dart';

class ErrorMessage extends StatefulWidget {
  final String errormsg;
  const ErrorMessage({
    Key? key,
    required this.errormsg,
  }) : super(key: key);

  @override
  State<ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    showErrormsg(String msg){
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
            title: Text('ERROR'),
            content: Text(msg),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
      });
    }
    return Container(
      child: showErrormsg(widget.errormsg),
    );
  }
}
