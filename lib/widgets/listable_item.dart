import 'package:flutter/material.dart';

import '../colors.dart';

class ListableItem extends StatelessWidget {
  final int id;
  final String title;
  final String town;
  final int price;

  const ListableItem({
    super.key, required this.id, required this.title, required this.town, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16), // Image border
            child: Image.asset('assets/images/cover_$id.jpg',
                width: 132, height: 132, fit: BoxFit.cover),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            town,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Icon(Icons.place, color: baseGrey7Color, size: 24,),
              Text(
                "от $price ₽",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}