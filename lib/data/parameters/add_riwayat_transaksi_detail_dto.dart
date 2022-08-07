class AddRiwayatTransaksiDetailDTO{
  String? id_riwayat_transaksi_detail,
  nama_produk,
  desc_produk,
  harga_produk,
  id_produk,
  id_riwayat_transaksi,
  id_user,
  id_toko,
  created_at,
  updated_at;

  int? status_transaksi;

  AddRiwayatTransaksiDetailDTO(
    {
      this.created_at,
      this.desc_produk,
      this.harga_produk,
      this.id_produk,
      this.id_riwayat_transaksi,
      this.id_riwayat_transaksi_detail,
      this.id_toko,
      this.id_user,
      this.nama_produk,
      this.status_transaksi,
      this.updated_at,
    }
  );
}