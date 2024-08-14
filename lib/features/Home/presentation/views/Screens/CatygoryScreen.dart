import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/cateory.dart';
import '../../../data/models/Category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // Define the list of categories here
  final List<Category> categories = [
    Category(name: 'Beauty', imageUrl: 'category image/photo_12_2024-07-23_21-30-07.jpg'),
    Category(name: 'Fragrances', imageUrl: 'category image/photo_22_2024-07-23_21-30-07.jpg'),
    Category(name: 'Furniture', imageUrl: 'category image/photo_14_2024-07-23_21-30-07.jpg'),
    Category(name: 'Groceries', imageUrl: 'category image/photo_19_2024-07-23_21-30-07.jpg'),
    Category(name: 'Home Decoration', imageUrl: 'category image/photo_15_2024-07-23_21-30-07.jpg'),
    Category(name: 'Kitchen Accessories', imageUrl: 'category image/photo_19_2024-07-23_21-30-07.jpg'),
    Category(name: 'Laptops', imageUrl: 'category image/photo_18_2024-07-23_21-30-07.jpg'),
    Category(name: 'Mens Shirts', imageUrl: 'category image/photo_11_2024-07-23_21-30-07.jpg'),
    Category(name: 'Mens Shoes', imageUrl: 'category image/photo_10_2024-07-23_21-30-07.jpg'),
    Category(name: 'Mens Watches', imageUrl: 'category image/photo_6_2024-07-23_21-30-07.jpg'),
    Category(name: 'Mobile Accessories', imageUrl: 'category image/photo_21_2024-07-23_21-30-07.jpg'),
    Category(name: 'Motorcycle', imageUrl: 'category image/photo_13_2024-07-23_21-30-07.jpg'),
    Category(name: 'Skin Care', imageUrl: 'category image/photo_20_2024-07-23_21-30-07.jpg'),
    Category(name: 'Smartphones', imageUrl: 'category image/photo_16_2024-07-23_21-30-07.jpg'),
    Category(name: 'Sports Accessories', imageUrl: 'category image/photo_17_2024-07-23_21-30-07.jpg'),
    Category(name: 'Sunglasses', imageUrl: 'category image/photo_9_2024-07-23_21-30-07.jpg'),
    Category(name: 'Tablets', imageUrl: 'category image/photo_17_2024-07-23_21-30-07.jpg'),
    Category(name: 'Tops', imageUrl: 'category image/photo_1_2024-07-23_21-30-07.jpg'),
    Category(name: 'Vehicle', imageUrl: 'category image/photo_3_2024-07-23_21-30-07.jpg'),
    Category(name: 'Womens Bags', imageUrl: 'category image/photo_7_2024-07-23_21-30-07.jpg'),
    Category(name: 'Womens Dresses', imageUrl: 'category image/photo_5_2024-07-23_21-30-07.jpg'),
    Category(name: 'Womens Jewellery', imageUrl: 'category image/photo_4_2024-07-23_21-30-07.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Categories",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.stacked_line_chart),
            color: Colors.orange,
            onPressed: () {
              // Add functionality for forward button
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}
