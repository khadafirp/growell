class ListProdukPenjualModel {
  ListProdukPenjualEntity? entity;
  ListProdukPenjualModel({this.entity});

  factory ListProdukPenjualModel.fromJson(List<dynamic> json){
    List<ProdukPenjualEntity>? data = [];
    json.forEach((element) {
      data.add(
        ProdukPenjualEntity(
          id_produk: element['id_produk'],
          nama_produk: element['nama_produk'],
          id_kategori: element['id_kategori'],
          kode_barcode: element['kode_barcode'],
          id_user: element['id_user'],
          path: element['path'],
          size: element['size'],
          stok: element['stok'],
          created_at: element['created_at'],
          updated_at: element['updated_at'],
          harga_produk: element['harga_produk'],
          detail_produk: element['detail_produk']
        )
      );
    });
    return ListProdukPenjualModel(
      entity: ListProdukPenjualEntity(
        entity: data
      )
    );
  }
}

class ListProdukPenjualEntity {
  List<ProdukPenjualEntity>? entity;
  ListProdukPenjualEntity({this.entity});

  factory ListProdukPenjualEntity.initial(){
    return ListProdukPenjualEntity(
      entity: []
    );
  }
}

class ProdukPenjualEntity {
  String? id_produk, harga_produk, detail_produk, nama_produk, id_kategori, kode_barcode, id_user, path, size, total_amount, created_at, updated_at, id_pembeli;
  int? stok, jumlah_belanjaan;

  ProdukPenjualEntity({
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
    this.detail_produk,
    this.total_amount,
    this.jumlah_belanjaan,
    this.id_pembeli
  });
}