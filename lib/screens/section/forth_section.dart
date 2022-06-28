import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/screen_offset.dart';
import 'package:ui_design_tutorial_food/widgets/text_reveal.dart';

class FourthSection extends StatefulWidget {
  const FourthSection({Key? key}) : super(key: key);

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOffsetValue > 2200) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      if (state.scrollOffsetValue > 2500) {
        controller.forward();
      } else {
        controller.reverse();
      }
      return SizedBox(
        height: 500.0,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Flexible(
              child: Stack(
                children: [
                  Container(
                    width: 400.0,
                    padding: const EdgeInsets.all(1.0),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1476887334197-56adbf254e1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: imageRevealAnimation,
                    builder: (context, child) {
                      return Container(
                        height: imageRevealAnimation.value,
                        width: double.infinity,
                        color: Colors.white,
                        alignment: const Alignment(0.0, -1.0),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            AnimatedBuilder(
                animation: textRevealAnimation,
                builder: (context, child) {
                  return Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextReveal(
                          controller: controller,
                          maxHeight: 55.0,
                          child: Text(
                            'Order your',
                            style: GoogleFonts.quicksand(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        TextReveal(
                          controller: controller,
                          maxHeight: 55.0,
                          child: Text(
                            'Favourite Food',
                            style: GoogleFonts.quicksand(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        AnimatedBuilder(
                            animation: subTextOpacityAnimation,
                            builder: (context, child) {
                              return FadeTransition(
                                opacity: subTextOpacityAnimation,
                                child: Text(
                                  'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        AnimatedBuilder(
                            animation: subTextOpacityAnimation,
                            builder: (context, child) {
                              return FadeTransition(
                                opacity: subTextOpacityAnimation,
                                child: Text(
                                  'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          alignment: const Alignment(0.0, -1.0),
                          height: 90.0,
                          child: AnimatedBuilder(
                              animation: subImageRevealAnimation,
                              builder: (context, child) {
                                return SizedBox(
                                  height: subImageRevealAnimation.value,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1464305795204-6f5bbfc7fb81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1570145820404-cf22b115b06f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
          ],
        ),
      );
    });
  }
}
