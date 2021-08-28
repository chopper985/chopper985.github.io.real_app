import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Adapative extends StatelessWidget {
  final String text;
  final Function handler;
  const Adapative({Key? key, required this.text, required this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: const Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: handler(),
          )
        // ignore: deprecated_member_use
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: const Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: handler(),
          );
  }
}
