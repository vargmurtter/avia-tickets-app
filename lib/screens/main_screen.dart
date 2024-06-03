import 'package:flutter/material.dart';
import '../colors.dart';
// import '../images.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          child: Center(
            child: Text("Поиск дешевых авиабилетов",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: specWhiteColor,
                    fontFamily: "Pro-Display",
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
          ),
        ),

        // search field
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: baseGrey3Color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: baseGrey4Color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    )
                  ]),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Минск",
                            style: TextStyle(
                              fontFamily: "Pro-Display",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: baseWhiteColor,
                            )),
                        Divider(
                          thickness: 1,
                          color: baseGrey5Color,
                          endIndent: 15,
                        ),
                        Text("Куда - Турция",
                            style: TextStyle(
                              fontFamily: "Pro-Display",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: baseGrey6Color,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        // music section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Музыкально отлететь",
              style: TextStyle(
                fontFamily: "Pro-Display",
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.white,
              )),
        ),

        const SizedBox(
          height: 20,
        ),

        SizedBox(
          height: 230,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.vertical,
                    spacing: 8,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16), // Image border
                        child: Image.asset('assets/images/cover_0.png',
                            width: 132, height: 132, fit: BoxFit.cover),
                      ),
                      const Text(
                        "Die Antwoord",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Будапешт",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.place, color: baseGrey7Color, size: 24,),
                          const Text(
                            "от 22 264 ₽",
                            style: TextStyle(
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
              }),
        ),

        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(328, 42),
              backgroundColor: baseGrey3Color,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Показать все места", style: TextStyle(
              color: Colors.white,
              fontFamily: "Pro-Display",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontStyle: FontStyle.italic
            )), 
          ),
        ),
      ],
    );
  }
}
