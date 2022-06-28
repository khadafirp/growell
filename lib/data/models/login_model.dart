class LoginModel {
  LoginEntity? entity;
  LoginModel({this.entity});

  factory LoginModel.fromJson(dynamic json){
    return LoginModel(
      entity: LoginEntity(
        idUser: json['id_user'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        noTelp: json['no_telp'],
        userKategori: json['user_kategori'],
        alamatToko: json['alamat_toko'],
        namaToko: json['nama_toko'],
        descToko: json['desc_toko'],
        path: json['path'],
        fileSize: json['file_size'],
        createdAd: json['created_at'],
        updatedAd: json['updated_at'],
        fullname: json['fullname']
      )
    );
  }
}

class LoginEntity {
  String? idUser, username, password, email, noTelp, alamatToko, namaToko, descToko, path, fileSize, createdAd, updatedAd, fullname;
  int? userKategori;

  LoginEntity(
    {
      this.idUser,
      this.username,
      this.password,
      this.email,
      this.userKategori,
      this.noTelp,
      this.alamatToko,
      this.namaToko,
      this.descToko,
      this.path,
      this.fileSize,
      this.createdAd,
      this.updatedAd,
      this.fullname
    }
  );
}