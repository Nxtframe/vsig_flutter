import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsig_flutter/constants/colors.dart';
import 'package:vsig_flutter/constants/fonts.dart';
import 'package:vsig_flutter/services/screendimensions.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {super.key,
      required this.iconPath,
      required this.label,
      this.color,
      this.isSelected = false,
      required this.onPressed});

  final String iconPath;
  final String label;
  final Color? color;
  final bool isSelected;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Color activeColor =
        const Color.fromARGB(255, 21, 39, 202); // Selected item color
    Color inactiveColor = Colors.grey; // Non-selected item color
    return MaterialButton(
      minWidth: screenWidth(context) * 0.097,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath,
              colorFilter: ColorFilter.mode(
                  isSelected ? activeColor : inactiveColor, BlendMode.srcIn),
              width: screenWidth(context) * 0.072), //0.078
          Text(
            label,
            style: GoogleFonts.getFont(
              fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: screenHeight(context) * 0.013, //size_10
              height: 1.25,
              color: isSelected ? color : gray_1,
            ),
          )
        ],
      ),
    );
  }
}
