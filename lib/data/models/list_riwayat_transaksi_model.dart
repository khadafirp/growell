class ListRiwayatTransaksiModel{
  ListRiwayatTransaksiEntity? entity;
  ListRiwayatTransaksiModel({this.entity});

  factory ListRiwayatTransaksiModel.fromJson(dynamic json){
    return ListRiwayatTransaksiModel(
      entity: ListRiwayatTransaksiEntity(
        data: json['data'],
        message: json['message'],
        statusCode: json['statusCode']
      )
    );
  }
}

class ListRiwayatTransaksiEntity{
  dynamic data;
  String? message;
  int? statusCode;

  ListRiwayatTransaksiEntity({this.data, this.message, this.statusCode});
}