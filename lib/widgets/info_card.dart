import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/constants.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: displayPixel! >= 2000
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 575),
      alignment: Alignment.center,
      reverseDuration: const Duration(milliseconds: 375),
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeIn,
      firstChild: const SizedBox(
        height: 230.0,
        width: 200.0,
      ),
      secondChild: Container(
        margin: const EdgeInsets.all(12.0),
        height: 230.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              title,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w500,
                fontSize: 11.0,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
