class ListUserModel {
  ListUserEntity? entity;
  ListUserModel({this.entity});

  factory ListUserModel.fromJson(dynamic json){
    List<UserEntity> data = [];
    for (var item in json) {
      data.add(
        UserEntity(
          id_user: item['id_user'],
          alamat_toko: item['alamat_toko'],
          created_at: item['created_at'],
          desc_toko: item['desc_toko'],
          email: item['email'],
          file_size: item['file_size'],
          fullname: item['fullname'],
          nama_toko: item['nama_toko'],
          no_telp: item['no_telp'],
          path: item['path'],
          updated_at: item['updated_at'],
          user_kategori: item['user_kategori']
        )
      );
    }
    return ListUserModel(
      entity: ListUserEntity(
        entity: data
      ),
    );
  }
}

class ListUserEntity{
  List<UserEntity>? entity;
  ListUserEntity({this.entity});


  factory ListUserEntity.initial(){
    return ListUserEntity(
      entity: []
    );
  }
}

class UserEntity {
  int? user_kategori;
  String? id_user, email, no_telp, alamat_toko, nama_toko, desc_toko, path, file_size, created_at, updated_at, fullname;

  UserEntity(
    {
      this.id_user,
      this.email, 
      this.no_telp,
      this.user_kategori,
      this.alamat_toko,
      this.nama_toko,
      this.desc_toko,
      this.path,
      this.file_size,
      this.created_at,
      this.updated_at,
      this.fullname
    }
  );
}