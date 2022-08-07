import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/models/add_riwayat_transaksi_model.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_detail_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';
import 'package:growell/domain/usecases/add_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/add_riwayat_transaksi_detail_use_case.dart';
import 'package:growell/domain/usecases/add_riwayat_transaksi_use_case.dart';
import 'package:growell/domain/usecases/edit_produk_use_case.dart';
import 'package:growell/domain/usecases/get_list_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';

class KeranjangPenjualBloc extends Bloc<KeranjangPenjualEvent, KeranjangPenjualState>{

  AddKeranjangProdukPenjualUseCase? addKeranjangProdukPenjualUseCase;
  GetListKeranjangProdukPenjualUseCase? getListKeranjangProdukPenjualUseCase;
  AddRiwayatTransaksiUseCase? addRiwayatTransaksiUseCase;
  AddRiwayatTransaksiDetailUseCase? addRiwayatTransaksiDetailUseCase;

  KeranjangPenjualBloc(
    this.addKeranjangProdukPenjualUseCase,
    this.getListKeranjangProdukPenjualUseCase,
    this.addRiwayatTransaksiUseCase,
    this.addRiwayatTransaksiDetailUseCase
  ) : super(InitialKeranjangPenjualState()){
    on<AddKeranjangPenjualEvent>(addKeranjangProduk);
    on<GetListKeranjangProdukPenjualEvent>(getListKeranjangProdukPenjual);
    on<AddRiwayatTransaksiEvent>(addRiwayatTransaksi);
    on<AddRiwayatTransaksiDetailEvent>(addRiwayatTransaksiDetail);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorAddKeranjangPenjual(message: error));
    super.onError(error, stacktrace);
  }

  void addKeranjangProduk(AddKeranjangPenjualEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingKeranjangPenjualState());
    var response = await addKeranjangProdukPenjualUseCase!.call(params: event.params!);
    emit(
      response.fold(
        (l) => LoadedKeranjangPenjualState(entity: l.entity), 
        (r) => ErrorKeranjangPenjualState(message: r.errorData.errorMessage)
      )
    );
  }

  void getListKeranjangProdukPenjual(GetListKeranjangProdukPenjualEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingGetListKeranjangProdukPenjualState());
    var response = await getListKeranjangProdukPenjualUseCase!.call(params: GetListKeranjangProdukDTO(
      id_user: event.params!.id_user,
      id_keranjang_toko: event.params!.id_keranjang_toko
    ));
    emit(
      response.fold(
        (l) => SuccessGetListKeranjangProdukPenjualState(
          entity: l.entity!
        ), 
        (r) => ErrorGetListKeranjangProdukPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }

  void addRiwayatTransaksi(AddRiwayatTransaksiEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingAddRiwayatTransaksiPenjualState());
    var response = await addRiwayatTransaksiUseCase!.call(params: event.params);
    emit(
      response.fold(
        (l) => SuccessAddRiwayatTransaksiPenjualState(
          entity: AddRiwayatTransaksiEntity(
            id_riwayat_transaksi: l.entity!.id_riwayat_transaksi,
            id_toko: l.entity!.id_toko,
            id_user: l.entity!.id_user,
            status_transaksi: l.entity!.status_transaksi,
            total_amount: l.entity!.total_amount
          )
        ), 
        (r) => ErrorAddRiwayatTransaksiPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }

  void addRiwayatTransaksiDetail(AddRiwayatTransaksiDetailEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingAddRiwayatTransaksiDetailPenjualState());
    var response = await addRiwayatTransaksiDetailUseCase!.call(params: AddRiwayatTransaksiDetailDTO(
      created_at: event.params!.created_at,
      desc_produk: event.params!.desc_produk,
      harga_produk: event.params!.harga_produk,
      id_produk: event.params!.id_produk,
      id_riwayat_transaksi: event.params!.id_riwayat_transaksi,
      id_riwayat_transaksi_detail: event.params!.id_riwayat_transaksi_detail,
      id_toko: event.params!.id_toko,
      id_user: event.params!.id_user,
      nama_produk: event.params!.nama_produk,
      status_transaksi: event.params!.status_transaksi,
      updated_at: event.params!.updated_at
    ));
    emit(
      response.fold(
        (l) => SuccessAddRiwayatTransaksiDetailPenjualState(), 
        (r) => ErrorAddRiwayatTransaksiDetailPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}