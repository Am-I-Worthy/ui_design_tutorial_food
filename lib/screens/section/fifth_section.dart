import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/chefs.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';
import 'package:ui_design_tutorial_food/widgets/chef_card.dart';
import 'package:ui_design_tutorial_food/widgets/text_reveal.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({Key? key}) : super(key: key);

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection>
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
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
          if (current.scrollOffsetValue > 2500) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, state) {
          if (state.scrollOffsetValue > 3100) {
            controller.forward();
          } else {
            controller.reverse();
          }
          return TextReveal(
            maxHeight: 55.0,
            controller: controller,
            child: Text(
              'Most Expert Chefs',
              style: GoogleFonts.quicksand(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chefs
              .map((chef) => ChefCard(
                    chef: chef,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
