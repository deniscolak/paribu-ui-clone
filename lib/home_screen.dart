import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paribu_ui_clone/model/coins_model.dart';
import 'package:paribu_ui_clone/model/slide_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const kGreenColor = Color(0xFF96A724);

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenWidth;
  Timer timer;
  int currentIndex = 0;
  int totalIndex;

  final ScrollController scrollController = PageController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(Duration(seconds: 3), (time) {
        if (currentIndex < totalIndex) {
          scrollController.animateTo(currentIndex * (screenWidth),
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutBack);
          currentIndex++;
        } else {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    totalIndex = slides.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          color: Color(0xFF96A724),
        ),
        toolbarHeight: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
        Container(
          height: 50,
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
          color: Color(0xFF96A724),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/logo.png", scale: 2),
                SizedBox(
                  width: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Deniz Çolak",
                        style: GoogleFonts.openSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(FlutterIcons.setting_ant, color: Colors.white)
                  ],
                ),
              ]),
        ),
        Container(
            color: kGreenColor,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              //controller: _pageController,
              controller: scrollController,

              children: List.generate(
                  slides.length,
                  (int index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              boxShadow: [],
                              color: Color(slides[index].kBackgroundColor)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 15,
                                top: 25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      slides[index].text,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          letterSpacing: -0.5,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      slides[index].altText,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          letterSpacing: -0.5,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        slides[index].bAltText,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            letterSpacing: -0.5,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 16,
                                  bottom: 30,
                                  child: Image.asset(
                                    slides[index].image,
                                    scale: 7,
                                  )),
                              Positioned(
                                  left: MediaQuery.of(context).size.width / 2 -
                                      32,
                                  bottom: 10,
                                  child: SmoothPageIndicator(
                                    controller: scrollController,
                                    count: slides.length,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: Colors.white,
                                        dotColor: Colors.white.withOpacity(0.2),
                                        dotHeight: 4.8,
                                        dotWidth: 6,
                                        spacing: 4.8),
                                  )),
                            ],
                          )))),
            )),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "VARLIKLARIM",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Container(
                width: 20,
                height: 5,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  border: Border.all(color: kGreenColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
              width: MediaQuery.of(context).size.width - 32,
              //height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 0, top: 16),
                      child: Text("Toplam Yaklaşık",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.7))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Row(
                        children: [
                          Text("61.061.34 TL",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.w400,
                                  color: kGreenColor)),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            FlutterIcons.eye_faw5,
                            color: Colors.grey,
                            size: 14,
                          )
                        ],
                      ),
                    )
                  ]),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 16, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kGreenColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                      child: Text(
                        "Cüzdan",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: kGreenColor),
                      ),
                    ),
                  )
                ],
              )),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "ALARMLARIM",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Container(
                width: 20,
                height: 5,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  border: Border.all(color: kGreenColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
              width: MediaQuery.of(context).size.width - 32,
              //height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 16, top: 16),
                      child: Text(
                          "Alarm'ı kurarak seçtiğiniz\nkripto para belirlediğiniz\nfiyata ulaştığında haberdar\nolabilirsiniz",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.7))),
                    ),
                  ]),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 16, bottom: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kGreenColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: 12, right: 10, top: 8, bottom: 8),
                      child: Text(
                        "Alarm Kur",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: kGreenColor),
                      ),
                    ),
                  )
                ],
              )),
        ),

        // Paribu Rehber Section
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "PARİBU REHBERİ",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Container(
                width: 20,
                height: 5,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  border: Border.all(color: kGreenColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 90,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(slides[index].miniSlider),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: [],
                        color: Color(0xFF96A724)),
                  ),
                );
              }),
        ),
        // Paribu İşlem Section
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "EN ÇOK İŞLEM GÖRENLER",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Container(
                width: 20,
                height: 5,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  border: Border.all(color: kGreenColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: coins.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 0, bottom: 0),
                child: Container(
                    //height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      boxShadow: [],
                      border: Border(
                          left: BorderSide(
                            //                   <--- left side
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                          right: BorderSide(
                            //                   <--- left side
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                          top: BorderSide(
                            //                    <--- top side
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          )),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 8, left: 12),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coins[index].name,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.7))),
                                    Text(coins[index].volume,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.grey.withOpacity(0.7))),
                                  ]),
                              SizedBox(
                                width: 180.0,
                              ),
                              Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(coins[index].price,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black
                                                  .withOpacity(0.7))),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(coins[index].change,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                  color: kGreenColor)),
                                          Icon(
                                            FlutterIcons.arrow_up_mco,
                                            color: kGreenColor,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                              Icon(FlutterIcons.chevron_right_fea,
                                  color: Colors.grey.withOpacity(0.7), size: 18)
                            ]))),
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                      child: Row(
                        children: [
                          Text("Daha fazla varlık keşfedin",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.5))),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(FlutterIcons.arrow_right_mco,
                              color: Colors.black.withOpacity(0.5), size: 16)
                        ],
                      ),
                    ),
                  ]),
                ],
              )),
        ),
      ])),
    );
  }
}
