
import 'package:flutter/material.dart';

import '../model/product.dart';

class CategoryMenuPage extends StatelessWidget {
const CategoryMenuPage({
Key? key,
required this.currentCategory,
required this.onCategoryTap,
}) : super(key: key);

final Category currentCategory;
final ValueChanged<Category> onCategoryTap;

String _categoryName(Category category) {
switch (category) {
case Category.all:
return 'ALL';
case Category.accessories:
return 'ACCESSORIES';
case Category.clothing:
return 'CLOTHING';
case Category.home:
return 'HOME';
}
}

@override
Widget build(BuildContext context) {
return ListView(
padding: const EdgeInsets.symmetric(vertical: 16.0),
children: Category.values.map((Category category) {
return ListTile(
selected: category == currentCategory,
title: Text(
_categoryName(category),
),
onTap: () {
onCategoryTap(category);
},
);
}).toList(),
);
}
}
