import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/filter_edit_produk_dto.dart';

class CardListEditProduk extends StatelessWidget {
  ProdukPenjualEntity? entity;
  CardListEditProduk({Key? key, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: Colors.grey)
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                'assets/jpg/scarlett.jpeg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.11,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              child: Text(
                entity!.nama_produk!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.09,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RoutesName.addProdukPage, arguments: FilterEditProdukDTO(
                        filter: "edit",
                        entity: ProdukPenjualEntity(
                          created_at: entity!.created_at,
                          detail_produk: entity!.detail_produk,
                          harga_produk: entity!.harga_produk,
                          id_kategori: entity!.id_kategori,
                          id_produk: entity!.id_produk,
                          id_user: entity!.id_user,
                          kode_barcode: entity!.kode_barcode,
                          nama_produk: entity!.nama_produk,
                          path: entity!.path,
                          size: entity!.size,
                          stok: entity!.stok,
                          updated_at: entity!.updated_at
                        )
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}