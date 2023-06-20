import 'package:flutter/material.dart';

class Info {
  String title;
  String description;
  IconData iconData;

  Info({
    required this.title,
    required this.description,
    required this.iconData,
  });
}

List<Info> infos = [
  Info(
    title: 'Pick Meals',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet.',
    iconData: Icons.mouse_rounded,
  ),
  Info(
    title: 'Choose Payment',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet.',
    iconData: Icons.monetization_on_outlined,
  ),
  Info(
    title: 'Select Address',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet.',
    iconData: Icons.location_on_outlined,
  ),
  Info(
    title: 'Fast Delivery',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet.',
    iconData: Icons.delivery_dining_outlined,
  ),
];
