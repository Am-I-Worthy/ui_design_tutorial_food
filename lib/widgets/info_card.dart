import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/constants.dart';
import 'package:ui_design_tutorial_food/modals/infos.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';

class InfoCard extends StatelessWidget {
  final Info info;
  const InfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (previous.scrollOffsetValue >= 2200) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      return AnimatedCrossFade(
        crossFadeState: state.scrollOffsetValue >= 2400
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 575),
        alignment: Alignment.center,
        reverseDuration: const Duration(milliseconds: 375),
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        firstChild: Container(
          height: 260.0,
          width: 220.0,
          margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
        ),
        secondChild: Container(
          margin: const EdgeInsets.all(25.0),
          height: 260.0,
          width: 220.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Icon(
                    info.iconData,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  info.title,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  info.description,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
