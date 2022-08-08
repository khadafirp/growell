import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';

class CustomChildPage extends StatefulWidget {
  Widget? child;
  String? title;
  CustomChildPage({Key? key, this.child, this.title}) : super(key: key);

  @override
  _CustomChildPageState createState() => _CustomChildPageState();
}

class _CustomChildPageState extends State<CustomChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
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
                    widget.title! == "Daftar Riwayat Transaksi" ?
                    const SizedBox()
                    :
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        widget.title ?? "Title",
                        style: TextStyle(
                          color: ListColor().baseColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * (widget.title! == "Detail Riwayat Transaksi" ? 0.80 : 0.83),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * (widget.title! == "Detail Riwayat Transaksi" ? 0.80 : 0.83),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    child: widget.child!,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}