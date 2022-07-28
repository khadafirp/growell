import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_dialog.dart';

class LoadingDialogView extends StatelessWidget{
  LoadingDialogView();

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Stack(
        // overflow: Overflow.visible,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: CircularProgressIndicator()
          ),
        ],
      ),
    );
  }
}