class Chef {
  String image;
  String name;
  String designation;

  Chef({
    required this.image,
    required this.name,
    required this.designation,
  });
}

List<Chef> chefs = [
  Chef(
    image:
        'https://images.unsplash.com/photo-1583394293214-28ded15ee548?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=220&h=300&q=80',
    name: 'Chao xi zao',
    designation: 'Head Chef',
  ),
  Chef(
    image:
        'https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320&h=400&q=80',
    name: 'Monica Geller',
    designation: 'Food Stylist',
  ),
  Chef(
    image:
        'https://images.unsplash.com/photo-1607631568010-a87245c0daf8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320&h=400&q=80',
    name: 'Steve Bones',
    designation: 'Spicy Food Maker',
  ),
  Chef(
    image:
        'https://images.unsplash.com/photo-1581299894007-aaa50297cf16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=420&h=500&q=80',
    name: 'Gary Dillan',
    designation: 'Food Taster',
  ),
];
