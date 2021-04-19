import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  const ClearButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      child: Text(label.toUpperCase()),
      
      onPressed: onPressed,
    );
  }
}
