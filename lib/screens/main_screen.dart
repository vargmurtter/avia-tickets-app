import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';
import '../features/offers/bloc/offers_bloc.dart';
import '../features/offers/ui/offer_list.dart';
import '../fonts.dart';
import '../widgets/main_menu.dart';
import 'search_bottom_sheet.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offersBloc = OffersBloc();
    offersBloc.add(OffersGetEvent());

    return BlocProvider<OffersBloc>(
      create: (BuildContext context) => offersBloc,
      child: Scaffold(
        backgroundColor: baseBlackColor,
        resizeToAvoidBottomInset: false,
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
                                // Text("Минск",
                                //     style: TextStyle(
                                //       fontFamily: mainFont,
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w600,
                                //       color: baseWhiteColor,
                                //     )),
                                const TextField(),
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

              // offers
              BlocBuilder<OffersBloc, OffersState>(
                bloc: offersBloc,
                builder: (BuildContext context, OffersState state) {
                  if (state is OffersLoadedState) {
                    return OfferListView(offers: state.offers);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      
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
      ),
    );
  }
}
