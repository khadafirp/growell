class DetailRiwayatTransaksiModel{
  DetailRiwayatTransaksiEntity? entity;
  DetailRiwayatTransaksiModel({this.entity});

  factory DetailRiwayatTransaksiModel.fromJson(dynamic json){
    return DetailRiwayatTransaksiModel(
      entity: DetailRiwayatTransaksiEntity(
        data: json['data'],
        message: json['message'],
        statusCode: json['statusCode']
      )
    );
  }
}

class DetailRiwayatTransaksiEntity{
  dynamic data;
  String? message;
  int? statusCode;

  DetailRiwayatTransaksiEntity({this.data, this.message, this.statusCode});
}