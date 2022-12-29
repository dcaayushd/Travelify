import 'dart:developer';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:travelify/utils/colors.dart';
import 'package:travelify/widgets/app_buttons.dart';
import 'package:travelify/widgets/app_large_text.dart';
import 'package:travelify/widgets/app_text.dart';
import 'package:travelify/widgets/responsive_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();

}

class _DetailsPageState extends State<DetailsPage> {
  double gottenStars = 4;
  int selectedIndex = 0;
    bool _isAddedToFavorite = false;
  @override
  void initState() {
    _loadSelection();
    super.initState();
  }
  
  // Load the selection state from shared preferences
  _loadSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
     _isAddedToFavorite = prefs.getBool('isAddedToFavorite') ?? false;
    });
  }

  // Save the selection state to shared preferences
  _saveSelection(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAddedToFavorite', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //Image Part
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Top Row Bar
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: IconButton(
                      onPressed: () {
                        //Use your function here
                        log('Clicked on the menu');
                      },
                      icon: const Icon(
                        FluentSystemIcons.ic_fluent_data_bar_vertical_regular,
                        color: AppColors.buttonBackground,
                      ),
                    ),
                  ),
                  const SizedBox(width: 280),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      onPressed: () {
                        //Use your function here
                        log('Clicked on the menu');
                      },
                      icon: const Icon(
                        FluentSystemIcons.ic_fluent_more_vertical_filled,
                        color: AppColors.buttonBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Rounded Part
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Destination tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Yosemite',
                          color: Colors.black54.withOpacity(0.8),
                        ),
                        const AppLargeText(
                            text: '\$ 250', color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Location tab
                    Row(
                      children: const [
                        Icon(
                          FluentSystemIcons.ic_fluent_location_filled,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: 5),
                        AppText(
                          text: 'USA, California',
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //Ratings Tab
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.circle,
                                color: index < gottenStars
                                    ? AppColors.mainColor
                                    : AppColors.textColor2);
                          }),
                        ),
                        const SizedBox(width: 10),
                        const AppText(
                          text: '(4.0)',
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    //Peoples tab
                    AppLargeText(
                      text: 'People',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    const AppText(
                      text: 'No of people in your group',
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(height: 10),
                    //Selection of number of people
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              log('No of people in your group: ${selectedIndex + 1}');
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: '${index + 1}',
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    AppLargeText(
                      text: 'Description',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(height: 10),
                    const AppText(
                      text:
                          'Yosemite National Park is a protected area in California that is known for its stunning rock formations and iconic views. It is a popular destination for hiking, rock climbing, photography, and sightseeing, and is also a UNESCO World Heritage Site.',
                      color: AppColors.mainTextColor,
                    )
                  ],
                ),
              ),
            ),
            //Bottom Part
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isAddedToFavorite = !_isAddedToFavorite;
                        log(_isAddedToFavorite == true
                            ? 'Added to favorite'
                            : 'Removed from favorite');
                      });
                       _saveSelection(_isAddedToFavorite);
                    },
                    child: AppButtons(
                      size: 60,
                      color: _isAddedToFavorite == true
                          ? Colors.red
                          : AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: _isAddedToFavorite == true
                          ? Colors.red
                          : AppColors.textColor1,
                      isIcon: true,
                      icon: _isAddedToFavorite == true
                          ? FluentSystemIcons.ic_fluent_heart_filled
                          : FluentSystemIcons.ic_fluent_heart_regular,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const AppResponsiveButton(
                    isResponsive: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
