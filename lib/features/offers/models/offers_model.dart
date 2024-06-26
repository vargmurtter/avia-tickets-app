import 'package:json_annotation/json_annotation.dart';
part 'offers_model.g.dart';


@JsonSerializable()
class OffersModel {
  List<OfferModel> offers;

  OffersModel({required this.offers});

  factory OffersModel.fromJson(Map<String, dynamic> json) => _$OffersModelFromJson(json);
  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}

@JsonSerializable()
class OfferModel {
  int id;
  String title;
  String town;
  OfferPriceModel price;

  OfferModel({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OffersListModelFromJson(json);
  Map<String, dynamic> toJson() => _$OffersListModelToJson(this);
}

@JsonSerializable()
class OfferPriceModel {
  int value;

  OfferPriceModel({required this.value});

  factory OfferPriceModel.fromJson(Map<String, dynamic> json) => _$OfferPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferPriceModelToJson(this);
}