import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/modals/chefs.dart';
import 'package:ui_design_tutorial_food/modals/constants.dart';
import 'package:ui_design_tutorial_food/modals/footer.dart';
import 'package:ui_design_tutorial_food/modals/infos.dart';
import 'package:ui_design_tutorial_food/modals/items.dart';
import 'package:ui_design_tutorial_food/section/first_section.dart';
import 'package:ui_design_tutorial_food/widgets/chef_card.dart';
import 'package:ui_design_tutorial_food/widgets/info_card.dart';
import 'package:ui_design_tutorial_food/widgets/item_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  // VisibilityDetectorController.instance.updateInterval = Duration.zero;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

double? displayPixel = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = false;

  var isFirstPageVisible = false;

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    GoogleFonts.quicksand();
    super.initState();

    controller.addListener(() {
      print(MediaQuery.of(context).size.height);
      print(controller.position.maxScrollExtent);
      print(controller.position.pixels);

      print('displayed pixels: ' +
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toString());

      setState(() {
        displayPixel =
            MediaQuery.of(context).size.height + controller.position.pixels;
      });
    });

    // SchedulerBinding.instance!.addPostFrameCallback((_) => setState(() {
    //       isFirstPageVisible = true;
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    // if (displayPixel! >= 0 &&
    //     displayPixel! < MediaQuery.of(context).size.height) {
    //   isFirstPageVisible = true;
    // } else {
    //   isFirstPageVisible = false;
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            const FirstSection(),
            const SizedBox(
              height: 50.0,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 375),
              opacity: displayPixel! > 800.0 ? 1 : 0,
              child: Text(
                'Dish of The Day',
                style: GoogleFonts.quicksand(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: Center(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 70.0,
                  spacing: 180.0,
                  children: items
                      .map(
                        (item) => ItemCard(
                          image: item.image,
                          title: item.title,
                          subtitle: item.subtitle,
                          description: item.description,
                          price: item.price,
                          index: items.indexOf(item) + 1,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                primary: Colors.white,
                backgroundColor: const Color(0xFFBE133C),
              ),
              onPressed: () {},
              child: Text(
                'View More',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 150.0,
            ),
            Container(
              height: 450,
              color: backgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 575),
                    opacity: displayPixel! >= 1900 ? 1.0 : 0.0,
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 575),
                      alignment:
                          Alignment(displayPixel! >= 1900 ? 0.0 : -0.2, 0.0),
                      child: Text(
                        'How It Works',
                        style: GoogleFonts.quicksand(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: infos
                              .map((info) => InfoCard(
                                  icon: info.iconData,
                                  title: info.title,
                                  description: info.description))
                              .toList()),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120.0,
            ),
            SizedBox(
              height: 500.0,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(
                    width: 400.0,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1476887334197-56adbf254e1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order your Favourite Food',
                          style: GoogleFonts.quicksand(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                          style: GoogleFonts.quicksand(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
                          style: GoogleFonts.quicksand(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          height: 90.0,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Text(
              'Most Expert Chefs',
              style: GoogleFonts.quicksand(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: chefs
                  .map((chef) => ChefCard(
                      image: chef.image,
                      name: chef.name,
                      designation: chef.designation))
                  .toList(),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 300.0,
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: footer
                          .map((footer) => FooterLink(
                              title: footer.title,
                              parameters: footer.parameters))
                          .toList(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 50.0,
                      right: 80.0,
                    ),
                    height: 200.0,
                    width: 250.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subscribe Now',
                          style: GoogleFonts.quicksand(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            hintText: 'Your Email',
                            hintStyle: GoogleFonts.quicksand(
                              color: Colors.black45,
                              fontWeight: FontWeight.w700,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 250.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Subscribe Now',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String title;
  final List<String> parameters;
  const FooterLink({Key? key, required this.title, required this.parameters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.quicksand(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: parameters
              .map(
                (params) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    params,
                    style: GoogleFonts.quicksand(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
