import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  BaseDialog({
    required this.child,
    this.padding = const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0
    )
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: child
    );
  }
}
