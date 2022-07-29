class ListKeranjangProdukModel{
  ListKeranjangProduk? entity;
  ListKeranjangProdukModel({this.entity});

  factory ListKeranjangProdukModel.fromJson(List<dynamic> json){

    List<ListKeranjangProdukEntity> data = [];

    for (var item in json) {
      data.add(
        ListKeranjangProdukEntity(
          id_keranjang_produk: item['id_keranjang_produk'],
          id_produk: item['id_produk'],
          created_at: item['created_at'],
          detail_produk: item['detail_produk'],
          edited_at: item['edited_at'],
          harga_produk: item['harga_produk'],
          id_keranjang_toko: item['id_keranjang_toko'],
          id_user: item['id_user'],
          jumlah_belanjaan: item['jumlah_belanjaan'],
          kode_barcode: item['kode_barcode'],
          nama_produk: item['nama_produk'],
          path: item['path'],
          total_amount: item['total_amount']
        )
      );
    }

    return ListKeranjangProdukModel(
      entity: ListKeranjangProduk(
        entity: data
      )
    );
  }
}

class ListKeranjangProduk {
  List<ListKeranjangProdukEntity>? entity;

  ListKeranjangProduk({this.entity});

  factory ListKeranjangProduk.inital(){
    return ListKeranjangProduk(
      entity: []
    );
  }
}

class ListKeranjangProdukEntity {
  String? id_keranjang_produk, id_produk, nama_produk, kode_barcode, id_user, harga_produk, detail_produk, created_at, path, id_keranjang_toko, total_amount, edited_at;
  int? jumlah_belanjaan;

  ListKeranjangProdukEntity(
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