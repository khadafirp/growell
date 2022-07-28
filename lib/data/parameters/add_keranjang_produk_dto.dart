class AddKeranjangProdukDTO {
  String? id_keranjang_produk, id_produk, nama_produk, kode_barcode, id_user, harga_produk, detail_produk, created_at, path, id_keranjang_toko, total_amount, edited_at;
  int? jumlah_belanjaan;

  AddKeranjangProdukDTO(
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