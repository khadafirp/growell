import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';

class CustomChildPage extends StatefulWidget {
  Widget? child;
  CustomChildPage({Key? key, this.child}) : super(key: key);

  @override
  _CustomChildPageState createState() => _CustomChildPageState();
}

class _CustomChildPageState extends State<CustomChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 16, top: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: ListColor().baseColor,
                        ),
                        Text(
                          "Kembali",
                          style: TextStyle(
                            color: ListColor().baseColor,
                            fontSize: 13
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.86,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.86,
                width: MediaQuery.of(context).size.width,
                child: widget.child!,
              ),
            ),
          )
        ],
      ),
    );
  }
}