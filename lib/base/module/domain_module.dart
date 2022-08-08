import 'package:growell/base/module/base_modul.dart';
import 'package:growell/domain/usecases/add_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/add_keranjang_toko_use_case.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/add_riwayat_transaksi_detail_use_case.dart';
import 'package:growell/domain/usecases/add_riwayat_transaksi_use_case.dart';
import 'package:growell/domain/usecases/add_user_use_case.dart';
import 'package:growell/domain/usecases/detail_riwayat_transaksi_use_case.dart';
import 'package:growell/domain/usecases/edit_produk_use_case.dart';
import 'package:growell/domain/usecases/get_list_all_user_use_case.dart';
import 'package:growell/domain/usecases/get_list_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/get_list_keranjang_toko_use_case.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/get_list_riwayat_transaksi_use_case.dart';
import 'package:growell/domain/usecases/login_use_case.dart';
import 'package:growell/utils/preference.dart';

void domainModule() {
  injector.registerLazySingleton(() => AddUserUseCase(injector()));
  injector.registerLazySingleton(() => LoginUseCase(injector()));
  injector.registerLazySingleton(() => AddProdukUseCase(injector()));
  injector.registerLazySingleton(() => GetListProdukPenjualUseCase(injector()));
  injector.registerLazySingleton(() => EditProdukUseCase(injector()));
  injector.registerLazySingleton(() => GetListAllUserUseCase(injector()));
  injector.registerLazySingleton(() => AddKeranjangProdukPenjualUseCase(injector()));
  injector.registerLazySingleton(() => GetListKeranjangProdukPenjualUseCase(injector()));
  injector.registerLazySingleton(() => AddKeranjangTokoUseCase(injector()));
  injector.registerLazySingleton(() => GetListKeranjangTokoUseCase(injector()));
  injector.registerLazySingleton(() => AddRiwayatTransaksiUseCase(injector()));
  injector.registerLazySingleton(() => AddRiwayatTransaksiDetailUseCase(injector()));
  injector.registerLazySingleton(() => GetListRiwayatTransaksiUseCase(injector()));
  injector.registerLazySingleton(() => DetailRiwayatTransaksiUseCase(injector()));
}
