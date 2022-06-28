import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/constants.dart';
import 'package:ui_design_tutorial_food/modals/infos.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';
import 'package:ui_design_tutorial_food/widgets/info_card.dart';
import 'package:ui_design_tutorial_food/widgets/text_reveal.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      color: backgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          BlocBuilder<DisplayOffset, ScrollOffset>(
              buildWhen: (previous, current) {
            if (previous.scrollOffsetValue >= 1800) {
              return true;
            } else {
              return false;
            }
          }, builder: (context, state) {
            if (state.scrollOffsetValue > 2000.0) {
              controller.forward();
            } else {
              controller.reverse();
            }
            return TextReveal(
              controller: controller,
              maxHeight: 55.0,
              child: Text(
                'How It Works',
                style: GoogleFonts.quicksand(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }),
          const SizedBox(
            height: 40.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: infos
                  .map((info) => InfoCard(
                      icon: info.iconData,
                      title: info.title,
                      description: info.description))
                  .toList()),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
