import 'package:flutter/material.dart';

import '../colors.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.95,
      child: Container(
          height: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              _topTrigger(),
              const Column(
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
              )
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
