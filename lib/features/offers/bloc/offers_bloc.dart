import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../service/api_service.dart';
import '../models/offers_model.dart';

part 'offers_event.dart';
part 'offers_state.dart';


class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersInitialState()) {
    on<OffersGetEvent>(_onGetOffers);
  }

  void _onGetOffers(OffersGetEvent event, Emitter<OffersState> emit) async {
    emit(OffersLoadingState());

    final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    OffersModel offersData = await apiService.getOffers();
    
    emit(OffersLoadedState(offers: offersData.offers));
  }
}
