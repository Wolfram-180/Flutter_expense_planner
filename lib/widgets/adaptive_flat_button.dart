import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  late final VoidCallback handler;
  late final String text;

  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    final _btnChsDt = Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );

    return Platform.isIOS
        ? CupertinoButton(
            child: _btnChsDt,
            onPressed: handler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: _btnChsDt,
            onPressed: handler,
          );
  }
}
