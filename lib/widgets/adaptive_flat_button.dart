import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final VoidCallback handler;
  final String text;

  const AdaptiveFlatButton(this.text, this.handler, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _btnChsDt = Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );

    return Platform.isIOS
        ? CupertinoButton(
            child: _btnChsDt,
            onPressed: handler,
          )
        : TextButton(
            child: _btnChsDt,
            onPressed: handler,
          );
  }
}
