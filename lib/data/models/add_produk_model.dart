class AddProdukModel {
  AddProdukEntity? entity;
  AddProdukModel({this.entity});


  factory AddProdukModel.fromJson(dynamic json){
    return AddProdukModel(
      entity: AddProdukEntity(
        statusCode: json['statusCode'],
        message: json['message'],
        id_produk: json['id_produk'],
        nama_produk: json['nama_produk'],
        id_kategori: json['id_kategori'],
        kode_barcode: json['kode_barcode'],
        id_user: json['id_user'],
        path: json['path'],
        size: json['size'],
        stok: json['stok'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        harga_produk: json['harga_produk'],
        detail_produk: json['detail_produk']
      )
    );
  }
}

class AddProdukEntity {
  String? message, id_produk, harga_produk, detail_produk, nama_produk, id_kategori, kode_barcode, id_user, path, size, created_at, updated_at;
  int? statusCode, stok;
  AddProdukEntity(
    {
      this.statusCode,
      this.message,
      this.id_produk,
      this.nama_produk,
      this.id_kategori,
      this.kode_barcode,
      this.id_user,
      this.path,
      this.size,
      this.stok,
      this.created_at,
      this.updated_at,
      this.harga_produk,
      this.detail_produk
    }
  );
}