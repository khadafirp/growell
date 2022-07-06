class AddProdukDTO {
  String? id_produk, harga_produk, detail_produk, nama_produk, id_kategori, kode_barcode, id_user, path, size, created_at, updated_at;
  int? stok;
  AddProdukDTO(
    {
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