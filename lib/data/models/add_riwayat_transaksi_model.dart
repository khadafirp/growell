class AddRiwayatTransaksiModel{
  AddRiwayatTransaksiEntity? entity;
  AddRiwayatTransaksiModel({this.entity});

  factory AddRiwayatTransaksiModel.fromJson(dynamic json){
    return AddRiwayatTransaksiModel(
      entity: AddRiwayatTransaksiEntity(
        id_riwayat_transaksi: json['id_riwayat_transaksi'],
        id_toko: json['id_toko'],
        id_user: json['id_user'],
        status_transaksi: json['status_transaksi'].toString(),
        total_amount: json['total_amount']
      )
    );
  }
}

class AddRiwayatTransaksiEntity {
  String? id_riwayat_transaksi, total_amount, status_transaksi, id_user, id_toko;
  AddRiwayatTransaksiEntity(
    {
      this.id_riwayat_transaksi, this.total_amount, this.status_transaksi, this.id_toko, this.id_user
    }
  );
}