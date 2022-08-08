import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';
import 'package:growell/domain/usecases/add_keranjang_toko_use_case.dart';
import 'package:growell/domain/usecases/detail_riwayat_transaksi_use_case.dart';
import 'package:growell/domain/usecases/get_list_all_user_use_case.dart';
import 'package:growell/domain/usecases/get_list_riwayat_transaksi_use_case.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_event.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_state.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_event.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_state.dart';

class RiwayatTransaksiBloc extends Bloc<RiwayatTransaksiEvent, RiwayatTransaksiState>{
  
  GetListRiwayatTransaksiUseCase getListRiwayatTransaksiUseCase;
  DetailRiwayatTransaksiUseCase detailRiwayatTransaksiUseCase;

  RiwayatTransaksiBloc(
    this.getListRiwayatTransaksiUseCase,
    this.detailRiwayatTransaksiUseCase
  ) : super(InitialGetListRiwayatTransaksiState()){
    on<GetListRiwayatTransaksiEvent>(getListRiwayatTransaksi);
    on<GetDetailRiwayatTransaksiEvent>(getDetailRiwayatTransaksi);
  }
  
  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorRiwayatTransaksiState(error));
    super.onError(error, stacktrace);
  }

  void getListRiwayatTransaksi(GetListRiwayatTransaksiEvent event, Emitter<RiwayatTransaksiState> emit) async {
    emit(LoadingGetListRiwayatTransaksiState());

    var response = await getListRiwayatTransaksiUseCase.call(params: event.params!);

    emit(
      response.fold(
        (l) => LoadedGetListRiwayatTransaksiState(entity: l.entity!), 
        (r) => ErrorGetListRiwayatTransaksiState(
          message: r.errorData.errorMessage
        )
      )
    );
  }

  void getDetailRiwayatTransaksi(GetDetailRiwayatTransaksiEvent event, Emitter<RiwayatTransaksiState> emit) async {
    emit(LoadingGetDetailRiwayatTransaksiState());

    var response = await detailRiwayatTransaksiUseCase.call(params: event.params!);

    emit(
      response.fold(
        (l) => LoadedGetDetailRiwayatTransaksiState(entity: l.entity!), 
        (r) => ErrorGetDetailRiwayatTransaksiState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}