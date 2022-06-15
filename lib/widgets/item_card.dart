import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_design_tutorial_food/main.dart';
import 'package:ui_design_tutorial_food/modals/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;
  const ItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isHovered = false;
  bool isVisible = false;
  late VisibilityDetectorController _controller;

  @override
  void initState() {
    _controller = VisibilityDetectorController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (displayPixel! > (1000 + (widget.index * 100))) {
      isVisible = true;
    } else {
      isVisible = false;
    }
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 375),
        height: 170.0,
        width: 420.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: isHovered
              ? [
                  const BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 20.0,
                    color: Colors.black12,
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 170.0,
              width: 170.0,
              child: Center(
                child: AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0,
                  duration: const Duration(milliseconds: 375),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 375),
                    height: isVisible ? 170.0 : 0.0,
                    width: isVisible ? 170.0 : 0.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0,
                    duration: const Duration(milliseconds: 375),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0,
                    duration: const Duration(milliseconds: 575),
                    child: Text(
                      widget.subtitle,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0,
                    duration: const Duration(milliseconds: 875),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0,
                    duration: const Duration(milliseconds: 1075),
                    child: Text(
                      widget.price,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
