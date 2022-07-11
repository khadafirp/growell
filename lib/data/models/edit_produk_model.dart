class EditProdukModel {
  EditProdukEntity? entity;
  EditProdukModel({this.entity});

  factory EditProdukModel.fromJson(dynamic json){
    return EditProdukModel(
      entity: EditProdukEntity(
        message: json['message'],
        statusCode: json['statusCode'].toString()
      )
    );
  }
}

class EditProdukEntity {
  String? message, statusCode;
  EditProdukEntity({this.message, this.statusCode});
}