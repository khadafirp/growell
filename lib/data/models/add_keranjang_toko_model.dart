class AddKeranjangTokoModel{
  AddKeranjangTokoEntity? entity;
  AddKeranjangTokoModel({this.entity});

  factory AddKeranjangTokoModel.fromJson(dynamic json){
    return AddKeranjangTokoModel(
      entity: AddKeranjangTokoEntity(
        id_keranjang_toko: json['id_keranjang_toko'],
        id_user: json['id_user'],
        created_at: json['created_at']
      )
    );
  }
}

class AddKeranjangTokoEntity {
  String? id_keranjang_toko, id_user, created_at;

  AddKeranjangTokoEntity(
    {
      this.id_keranjang_toko,
      this.id_user,
      this.created_at
    }
  );
}