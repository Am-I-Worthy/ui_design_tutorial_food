import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';
import 'package:ui_design_tutorial_food/screens/section/fifth_section.dart';
import 'package:ui_design_tutorial_food/screens/section/first_section.dart';
import 'package:ui_design_tutorial_food/screens/section/forth_section.dart';
import 'package:ui_design_tutorial_food/screens/section/second_section.dart';
import 'package:ui_design_tutorial_food/screens/section/sixth_section.dart';
import 'package:ui_design_tutorial_food/screens/section/third_section.dart';
// import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class WholePage extends StatefulWidget {
  const WholePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<DisplayOffset>()
          .changeDisplayOffset(MediaQuery.of(context).size.height.toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      // physics: const NeverScrollableScrollPhysics(),
      child: const Column(
        children:  [
          FirstSection(),
          SizedBox(
            height: 100.0,
          ),
          SecondSection(),
          SizedBox(
            height: 100.0,
          ),
          ThirdSection(),
          SizedBox(
            height: 120.0,
          ),
          FourthSection(),
          SizedBox(
            height: 100.0,
          ),
          FifthSection(),
          SizedBox(
            height: 100,
          ),
          SixthSection(),
        ],
      ),
    );
  }
}
