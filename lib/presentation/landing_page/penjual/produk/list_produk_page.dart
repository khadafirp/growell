import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/widget/card/car_list_edit_produk.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class LIstProdukPage extends StatefulWidget {
  LIstProdukPage({Key? key}) : super(key: key);

  @override
  _LIstProdukPageState createState() => _LIstProdukPageState();
}

class _LIstProdukPageState extends State<LIstProdukPage> {
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Daftar Produk",
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.79,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return CardListEditProduk();
              }
            ),
          )
        ],
      ),
    );
  }
}