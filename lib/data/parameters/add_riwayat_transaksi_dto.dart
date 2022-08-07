class AddRiwayatTransaksiDTO {
  String? id_riwayat_transaksi, total_amount, id_user, id_toko;
  int? status_transaksi;
  AddRiwayatTransaksiDTO(
    {
      this.id_riwayat_transaksi, this.total_amount, this.status_transaksi, this.id_toko, this.id_user
    }
  );
}