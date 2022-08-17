import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:task/models/design.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => Scaffold(
        backgroundColor: Constants.kWhiteColor,
        extendBody: true,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Mostafa Helaly interior design',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.kBlackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10.w,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          controller: TabController(
                            length: 6,
                            initialIndex: 0,
                            vsync: this,
                          ),
                          indicator: BoxDecoration(
                            color: Constants.kYellowColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelColor: Constants.kWhiteColor,
                          unselectedLabelColor: Colors.grey,
                          labelPadding:
                              EdgeInsets.only(left: 20.w, right: 20.w),
                          isScrollable: true,
                          tabs: const [
                            Tab(text: "Design of children"),
                            Tab(text: "living room"),
                            Tab(text: "Design of children"),
                            Tab(text: "living room"),
                            Tab(text: "Design of children"),
                            Tab(text: "living room"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Different services',
                            style: TextStyle(
                              color: Constants.kBlackColor,
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: TextStyle(
                                color: Constants.kBlackColor.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 345,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: newdesigns.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                          } else if (index == newdesigns.length - 1) {
                          } else {}
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constants.kGreyColor.withOpacity(0.1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            newdesigns[index].designImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  //here
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        newdesigns[index].designName,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Constants.kBlackColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        newdesigns[index].designName2,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Constants.kBlackColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        newdesigns[index].designName3,
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Constants.kBlackColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text(
                                        '250 LE',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff80B1FE),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      RatingBar.builder(
                                        itemSize: 14,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        itemCount: 4,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Constants.kYellowColor,
                                        ),
                                        onRatingUpdate: (rating) {
                                          debugPrint(rating.toString());
                                        },
                                        unratedColor: Constants.kWhiteColor,
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          primary: const Color(0xff80B1FE),
                                        ),
                                        child: const Text(
                                          'Book',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Offers & Packages ',
                            style: TextStyle(
                              color: Constants.kBlackColor,
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: TextStyle(
                                color: Constants.kBlackColor.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                        } else {}
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    width: screenWidth * 0.89,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            upcomingdesigns[index].designImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text(
                                    upcomingdesigns[index].designName,
                                    style:const TextStyle(
                                      fontSize: 12,
                                      color: Constants.kBlackColor,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                 const Spacer(),
                                const  Text(
                                    '250 LE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff80B1FE),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const  SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.2),
                Constants.kGreenColor.withOpacity(0.2)
              ],
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kGreenColor,
                ],
              ),
            ),
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              fillColor: const Color(0xff404c57),
              child: SvgPicture.asset(Constants.kIconPlus),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GlassmorphicContainer(
          width: screenWidth,
          height: 72,
          borderRadius: 0,
          linearGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kBlackColor,
              Constants.kBlackColor,
            ],
          ),
          border: 0,
          blur: 30,
          borderGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ],
          ),
          child: BottomAppBar(
            color: Constants.kBlackColor,
            notchMargin: 4,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconHome,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconPlayOnTv,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(''),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconCategories,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconDownload,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
