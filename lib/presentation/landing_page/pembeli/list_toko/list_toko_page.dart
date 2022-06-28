import 'package:flutter/material.dart';
import 'package:growell/widget/card/card_produk_new.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class ListTokoPage extends StatefulWidget {
  ListTokoPage({Key? key}) : super(key: key);

  @override
  _ListTokoPageState createState() => _ListTokoPageState();
}

class _ListTokoPageState extends State<ListTokoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.79,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return CardProdukNew();
              }),
          ),
        ],
      ),
    );
  }
}