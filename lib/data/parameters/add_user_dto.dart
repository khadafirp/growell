import 'package:get/get_connect.dart';

class AddUserDTO {
  String? idUser, username, password, email, noTelp, alamatToko, namaToko, descToko, fullname, path;
  int? userKategori;

  AddUserDTO(
    {
      this.idUser,
      this.username, 
      this.password,
      this.email,
      this.noTelp,
      this.alamatToko,
      this.namaToko,
      this.descToko,
      this.userKategori,
      this.path,
      this.fullname
    }
  );
}