class ListKeranjangTokoModel {
  ListKeranjangToko? entity;
  ListKeranjangTokoModel({this.entity});

  factory ListKeranjangTokoModel.fromJson(dynamic json){
    List<ListKeranjangPemilikTokoEntity> data = [];
    List<ListKeranjangTokoEntity> dataToko = [];

    for (var item in json['pemilik_toko']) {
      data.add(
        ListKeranjangPemilikTokoEntity(
          alamat_toko: item['alamat_toko'],
          created_at: item['created_at'],
          desc_toko: item['desc_toko'],
          email: item['email'],
          file_size: item['file_size'],
          fullname: item['fullname'],
          id_keranjang_toko: item['id_keranjang_toko'],
          id_user: item['id_user'],
          nama_toko: item['nama_toko'],
          no_telp: item['no_telp'],
          password: item['password'],
          path: item['path'],
          updated_at: item['updated_at'],
          user_kategori: item['user_kategori'],
          username: item['username']
        )
      );
    }

    for (var item in json['keranjang_toko']) {
      dataToko.add(
        ListKeranjangTokoEntity(
          created_at: item['created_at'],
          id_keranjang_toko: item['id_keranjang_toko'],
          id_user: item['id_user']
        )
      );
    }

    return ListKeranjangTokoModel(
      entity: ListKeranjangToko(
        entity: data
      )
    );
  }
}

class ListKeranjangToko {
  List<ListKeranjangPemilikTokoEntity>? entity;
  List<ListKeranjangTokoEntity>? entityToko;
  ListKeranjangToko({this.entity, this.entityToko});

  factory ListKeranjangToko.initial(){
    return ListKeranjangToko(
      entity: [],
      entityToko: []
    );
  }
}

class ListKeranjangTokoEntity {
  String? id_keranjang_toko, id_user, created_at;
  ListKeranjangTokoEntity({this.id_keranjang_toko, this.id_user, this.created_at});
}

class ListKeranjangPemilikTokoEntity {
  String? id_keranjang_toko, id_user_pembeli, id_user, username, password, email, no_telp, alamat_toko, nama_toko, desc_toko, path, file_size, created_at, updated_at, fullname;
  int? user_kategori;

  ListKeranjangPemilikTokoEntity(
    {
      this.alamat_toko,
      this.created_at,
      this.desc_toko,
      this.email,
      this.file_size,
      this.fullname,
      this.id_keranjang_toko,
      this.id_user,
      this.id_user_pembeli,
      this.nama_toko,
      this.no_telp,
      this.password,
      this.path,
      this.updated_at,
      this.user_kategori,
      this.username
    }
  );
}