import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';

class ChefCard extends StatefulWidget {
  final String image;
  final String name;
  final String designation;
  final int index;
  const ChefCard({
    Key? key,
    required this.image,
    required this.name,
    required this.designation,
    required this.index,
  }) : super(key: key);

  @override
  State<ChefCard> createState() => _ChefCardState();
}

class _ChefCardState extends State<ChefCard> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween(begin: 220.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue > 2500) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      if (state.scrollOffsetValue > 3200) {
        controller.forward();
      } else {
        controller.reverse();
      }
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: 330.0,
              width: 220.0,
              margin: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 280.0,
                    width: 220.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment(
                              (widget.index % 2 == 1) ? 1.0 : -1.0, 1.0),
                          child: Container(
                            height: 280.0,
                            width: animation.value,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.name,
                    style: GoogleFonts.quicksand(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.designation,
                    style: GoogleFonts.quicksand(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
