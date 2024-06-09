import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../fonts.dart';
import '../models/offers_model.dart';
import '../service/api_service.dart';
import '../widgets/listable_item.dart';
import '../widgets/main_menu.dart';
import 'search_bottom_sheet.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseBlackColor,
      bottomNavigationBar: const MainMenu(),
      body: SafeArea(
        child: Column(
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
                        fontFamily: mainFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 22)),
              ),
            ),

            // search field
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: baseGrey2Color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: specBottomSheetColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (BuildContext context) =>
                            const SearchBottomSheet());
                  },
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
                                    fontFamily: mainFont,
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
                                    fontFamily: mainFont,
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
            ),

            const SizedBox(
              height: 30,
            ),

            // music section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Музыкально отлететь",
                  style: TextStyle(
                    fontFamily: mainFont,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white,
                  )),
            ),

            const SizedBox(
              height: 20,
            ),

            _getOffers(),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(328, 42),
                    backgroundColor: baseGrey2Color,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Показать все места",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: mainFont,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontStyle: FontStyle.italic)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder _getOffers() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiService.getOffers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final OffersModel offersData = snapshot.data!;
            return _offersList(offersData);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _offersList(OffersModel offersData) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
          itemCount: offersData.offers.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ListableItem(
              id: offersData.offers[index].id,
              title: offersData.offers[index].title,
              subtitle: offersData.offers[index].town,
              price: offersData.offers[index].price.value,
            );
          }),
    );
  }
}
