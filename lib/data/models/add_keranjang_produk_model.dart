class AddKeranjangProdukModel{
  AddKeranjangProdukEntity? entity;
  AddKeranjangProdukModel({this.entity});

  factory AddKeranjangProdukModel.fromJson(dynamic json){
    return AddKeranjangProdukModel(
      entity: AddKeranjangProdukEntity(
        id_keranjang_produk: json['id_keranjang_produk'],
        id_produk: json['id_produk'],
        created_at: json['created_at'],
        detail_produk: json['detail_produk'],
        edited_at: json['edited_at'],
        harga_produk: json['harga_produk'],
        id_keranjang_toko: json['id_keranjang_toko'],
        id_user: json['id_user'],
        jumlah_belanjaan: json['jumlah_belanjaan'],
        kode_barcode: json['kode_barcode'],
        nama_produk: json['nama_produk'],
        path: json['path'],
        total_amount: json['total_amount']
      )
    );
  }
}

class AddKeranjangProdukEntity {
  String? id_keranjang_produk, id_produk, nama_produk, kode_barcode, id_user, harga_produk, detail_produk, created_at, path, id_keranjang_toko, total_amount, edited_at;
  int? jumlah_belanjaan;

  AddKeranjangProdukEntity(
    {
      this.id_keranjang_produk,
      this.id_produk,
      this.nama_produk,
      this.kode_barcode,
      this.id_user,
      this.harga_produk,
      this.detail_produk,
      this.created_at,
      this.edited_at,
      this.id_keranjang_toko,
      this.jumlah_belanjaan,
      this.path,
      this.total_amount
    }
  );
}