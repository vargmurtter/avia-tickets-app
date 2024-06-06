import 'package:flutter/material.dart';

import '../colors.dart';

class SearchBackdrop extends StatelessWidget {
  const SearchBackdrop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 8) {
          return Navigator.pop(context);
        }
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              _topTrigger(),
              Container(
                  // decoration: BoxDecoration(),
                  child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.send_rounded),
                      // TextField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     hintText: 'Enter a search term',
                      //   ),
                      // ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }

  Center _topTrigger() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          width: 38,
          height: 5,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: baseGrey5Color,
                  borderRadius: BorderRadius.circular(16))),
        ),
      ),
    );
  }
}
