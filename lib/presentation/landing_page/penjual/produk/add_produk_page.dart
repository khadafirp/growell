import 'package:flutter/material.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';
import 'package:image_picker/image_picker.dart';

class AddProdukPage extends StatefulWidget {
  AddProdukPage({Key? key}) : super(key: key);

  @override
  _AddProdukPageState createState() => _AddProdukPageState();
}

class _AddProdukPageState extends State<AddProdukPage> {
  ImagePicker picker = ImagePicker();

  openCamera() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
      imageQuality: 70,
    );
    print(image.toString());
  }

  openGalery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
      imageQuality: 70,
    );
    print(image.toString());
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      openGalery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    openCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Tambah Produk",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Detail Produk",
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harga Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stok Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Stok Produk",
                  ),
                )
              ],
            ),
          ),
                    Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Foto Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => _showPicker(context),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.only(top: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text("Pilih Foto"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}