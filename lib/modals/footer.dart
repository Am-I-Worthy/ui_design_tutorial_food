class Footer {
  String title;
  List<String> parameters;

  Footer({
    required this.title,
    required this.parameters,
  });
}

List<Footer> footer = [
  Footer(
    title: 'Company',
    parameters: [
      'About',
      'Press',
      'Blog',
      'Careers',
      'Security',
      'Drive Center',
    ],
  ),
  Footer(
    title: 'Information',
    parameters: [
      'Our Story',
      'Recipes',
      'Nutrition',
      'Resources',
      'Newsletter',
      'Contact',
    ],
  ),
  Footer(
    title: 'Services',
    parameters: [
      'Customer Service',
      'Recommend a restaurant',
      'Signup a restaurant',
      'Jobs',
      'Press',
      'Terms of Use',
    ],
  ),
];

