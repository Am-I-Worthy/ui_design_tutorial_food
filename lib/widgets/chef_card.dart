import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/modals/chefs.dart';
// import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';

class ChefCard extends StatefulWidget {
  final Chef chef;
  const ChefCard({
    Key? key,
    required this.chef,
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

    animation = Tween(begin: 250.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue > 3400) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      if (state.scrollOffsetValue > 3600) {
        controller.forward();
      } else {
        controller.reverse();
      }
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: 355.0,
              width: 250.0,
              margin: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.0,
                    width: 250.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.network(
                            widget.chef.image,
                            fit: BoxFit.cover,
                            height: 300.0,
                            width: 250.0,
                          ),
                        ),
                        Align(
                          alignment: Alignment(
                              (widget.chef.index % 2 == 1) ? 1.0 : -1.0, 1.0),
                          child: Container(
                            height: 300.0,
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
                    widget.chef.name,
                    style: GoogleFonts.quicksand(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.chef.designation,
                    style: GoogleFonts.quicksand(
                      fontSize: 16.0,
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
