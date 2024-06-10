import 'package:flutter/material.dart';
import '../models/offers_model.dart';
import '../../../widgets/listable_item.dart';

class OfferListView extends StatelessWidget {
  final List<OfferModel> offers;

  const OfferListView({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: offers.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ListableItem(
              id: offers[index].id,
              title: offers[index].title,
              subtitle: offers[index].town,
              price: offers[index].price.value,
            );
          }),
    );
  }
}
