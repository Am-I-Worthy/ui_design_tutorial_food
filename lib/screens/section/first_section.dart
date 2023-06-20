import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/widgets/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageReveal;
  late Animation<double> smallImageOpacity;
  late Animation<double> navbarOpacity;

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

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));

    descriptionAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    smallImageReveal = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeOut)));

    smallImageOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));

    navbarOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));

    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100.0),
      height: 920,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: textOpacityAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Logo',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextReveal(
                                maxHeight: 90.0,
                                child: Text(
                                  'Healthy & Tasty',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 65.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                controller: controller,
                                textRevealAnimation: textRevealAnimation,
                                textOpacityAnimation: textOpacityAnimation,
                              ),
                              TextReveal(
                                maxHeight: 90.0,
                                child: Text(
                                  'Food',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 65.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                controller: controller,
                                textRevealAnimation: textRevealAnimation,
                                textOpacityAnimation: textOpacityAnimation,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              FadeTransition(
                                opacity: descriptionAnimation,
                                child: Text(
                                  'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              FadeTransition(
                                opacity: smallImageOpacity,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15.0,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                  child: SizeTransition(
                                    sizeFactor: smallImageOpacity,
                                    axis: Axis.horizontal,
                                    axisAlignment: -1.0,
                                    // alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        const Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.all(12.0),
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 49.0,
                                          width: 49.0,
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 120.0,
                                      width: 180.0,
                                      child: Stack(
                                        children: [
                                          FadeTransition(
                                            opacity: smallImageOpacity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1609618298169-425a11118f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80',
                                                fit: BoxFit.cover,
                                                width: 180.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 120.0,
                                            width: smallImageReveal.value,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: FadeTransition(
                                        opacity: smallImageOpacity,
                                        child: Text(
                                          'Lorem ipsum dolor sit amet. Sit rerum reiciendis et tenetur fuga et aliquam numquam. Qui omnis assumenda et reiciendis dicta aut animi aliquid qui molestiae ipsum.',
                                          style: GoogleFonts.quicksand(
                                            fontSize: 16.0,
                                            height: 1.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 150.0,
                ),
                const Expanded(
                  child: FirstPageImage(),
                ),
                SizedBox(
                  width: 100.0,
                  height: 500.0,
                  child: FadeTransition(
                    opacity: navbarOpacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 80.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: ['Home', 'About', 'Offers', 'Accounts']
                                .map<Widget>((title) {
                              return RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  title,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 14.0,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));

    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1551879400-111a9087cd86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 375), () {
            if (_controller.isDismissed) {
              _controller.forward();
            }
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    height: 920.0,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
            child: child,
          );
        }
        return const SizedBox();
      },
    );
  }
}
