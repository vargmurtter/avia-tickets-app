part of 'offers_bloc.dart';

@immutable
sealed class OffersState {}

final class OffersInitialState extends OffersState {}

final class OffersLoadedState extends OffersState {
  final List<OfferModel> offers;

  OffersLoadedState({required this.offers});
}

final class OffersLoadingState extends OffersState {}