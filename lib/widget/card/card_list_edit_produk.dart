import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/filter_edit_produk_dto.dart';
import 'package:growell/utils/currency_formatter.dart';

class CardListEditProduk extends StatelessWidget {
  ProdukPenjualEntity? entity;
  String? idKategoriUser, title;
  CardListEditProduk({Key? key, this.entity, this.idKategoriUser, this.title}) : super(key: key);

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
              child: Image.network(
                entity!.path!,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.11,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Text(
                      title == null ?
                      CurrencyFormatter.formatWithoutDecimal(double.parse(entity!.harga_produk!))
                      :
                      (CurrencyFormatter.formatWithoutDecimal(double.parse(entity!.harga_produk!)) + " x " + entity!.jumlah_belanjaan.toString() + " = "
                      +
                      CurrencyFormatter.formatWithoutDecimal(double.parse(title != null ? entity!.total_amount! : entity!.harga_produk!))),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
            idKategoriUser == "2" ?
            Container(
              // width: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: ListColor().baseColor
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
            :
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  title != null ?
                  const SizedBox()
                  :
                  Container(
                    width: MediaQuery.of(context).size.width * 0.08,
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
                  title != null ?
                    Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.red,
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    )
                  :
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
                      width: MediaQuery.of(context).size.width * 0.08,
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