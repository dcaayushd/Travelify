// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travelify/utils/colors.dart';
import 'package:travelify/widgets/app_text.dart';

class AppResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const AppResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const AppText(
                        text: 'Book Trip Now', color: Colors.white))
                : Container(),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
