// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
      offers: (json['offers'] as List<dynamic>)
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersModelToJson(OffersModel instance) =>
    <String, dynamic>{
      'offers': instance.offers,
    };

OfferModel _$OffersListModelFromJson(Map<String, dynamic> json) =>
    OfferModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      town: json['town'] as String,
      price: OfferPriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersListModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'town': instance.town,
      'price': instance.price,
    };

OfferPriceModel _$OfferPriceModelFromJson(Map<String, dynamic> json) =>
    OfferPriceModel(
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$OfferPriceModelToJson(OfferPriceModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
