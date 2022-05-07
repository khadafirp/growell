import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';

class ButtonBaseCustom extends StatelessWidget {
  Function function;
  String? text;
  ButtonBaseCustom({Key? key, required this.function, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: ListColor().baseColor,
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        alignment: Alignment.center,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ) 
    );
  }
}