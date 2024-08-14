import 'package:animal_app/features/Home/presentation/views/widgets/SmallCatygoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';

class HorizontalCategoryList extends StatelessWidget {
  final List<Category> categories;

  const HorizontalCategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return SmallCategoryWidget(category: category);
        },
      ),
    );
  }
}
