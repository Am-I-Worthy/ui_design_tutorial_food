import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefCard extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  const ChefCard({
    Key? key,
    required this.image,
    required this.name,
    required this.designation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 220.0,
      margin: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            name,
            style: GoogleFonts.quicksand(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            designation,
            style: GoogleFonts.quicksand(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}