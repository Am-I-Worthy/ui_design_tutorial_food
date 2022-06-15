import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with SingleTickerProviderStateMixin {
  var isFirstPageVisible = false;

  @override
  void initState() {
    super.initState();

    // SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     isFirstPageVisible = true;
    //   });
    // });

    Future.delayed(Duration(milliseconds: 375), () {
      setState(() {
        isFirstPageVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100.0),
      height: 720,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Logo',
                    style: GoogleFonts.montserrat(),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LimitedBox(
                          maxHeight: 78.0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 775),
                            padding: EdgeInsets.only(
                                top: isFirstPageVisible ? 0.0 : 100.0),
                            child: AnimatedOpacity(
                              opacity: isFirstPageVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 775),
                              child: Text(
                                'Healthy',
                                style: GoogleFonts.quicksand(
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        LimitedBox(
                          maxHeight: 70.0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 775),
                            padding: EdgeInsets.only(
                                top: isFirstPageVisible ? 0.0 : 100.0),
                            child: AnimatedOpacity(
                              opacity: isFirstPageVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 775),
                              child: Text(
                                'Food',
                                style: GoogleFonts.quicksand(
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        AnimatedOpacity(
                          opacity: isFirstPageVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1475),
                          child: Text(
                            'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                            style: GoogleFonts.quicksand(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 775),
                          opacity: isFirstPageVisible ? 1.0 : 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15.0,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      contentPadding: EdgeInsets.all(12.0),
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
                        const SizedBox(
                          height: 50.0,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 775),
                                opacity: isFirstPageVisible ? 1.0 : 0.0,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1609618298169-425a11118f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80',
                                  height: 80.0,
                                  width: 100.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Flexible(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 775),
                                  opacity: isFirstPageVisible ? 1.0 : 0.0,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet. Sit rerum reiciendis et tenetur fuga et aliquam numquam. Qui omnis assumenda et reiciendis dicta aut animi aliquid qui molestiae ipsum.',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 12.0,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Home',
                    style: GoogleFonts.quicksand(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'About',
                    style: GoogleFonts.quicksand(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Offers',
                    style: GoogleFonts.quicksand(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Contacts',
                    style: GoogleFonts.quicksand(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

    _animation = Tween<double>(begin: 720.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1655147260029-75bfe22efc90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(Duration(milliseconds: 375), () {
            _controller.forward();
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    height: 720.0,
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
