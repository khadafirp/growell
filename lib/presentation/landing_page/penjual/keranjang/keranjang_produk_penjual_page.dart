import 'package:flutter/material.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class KeranjangProdukPenjualPage extends StatefulWidget {
  KeranjangProdukPenjualPage({Key? key}) : super(key: key);

  @override
  _KeranjangProdukPenjualPageState createState() => _KeranjangProdukPenjualPageState();
}

class _KeranjangProdukPenjualPageState extends State<KeranjangProdukPenjualPage> {
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Keranjang",
      child: Text("Keranjang"),
    );
  }
}