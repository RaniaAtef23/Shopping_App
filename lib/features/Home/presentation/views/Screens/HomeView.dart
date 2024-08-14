import 'package:animal_app/core/network/service_locator.dart';
import 'package:animal_app/features/Home/presentation/Manager/Fetch_Product/fetch_product_cubit.dart';
import 'package:animal_app/features/Home/presentation/views/Screens/CatygoryScreen.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ProductGridView.dart';
import 'package:animal_app/features/authentication/presentation/views/screens/create_account_view.dart';
import 'package:animal_app/features/authentication/presentation/views/screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:animal_app/core/network/api_service.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';
import 'package:animal_app/features/Home/data/repo/repo_imp.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ImageSlider.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/category_list.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/popularProductList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final List<String> images2 = [
    'sales/3245285.jpg',
    'sales/3282665.jpg',
    'sales/5028786.jpg',
    'sales/sl_100222_53080_35.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FetchProductCubit(getIt.get<RepoHomeImpl>())
        ..Fetch_all_products(),
      child: BlocBuilder<FetchProductCubit, FetchProductState>(
        builder: (context, state) {
          if (state is FetchProductSuccess) {
            // Ensure images is a List<String>
            final images = state.products
                .expand((product) => product.images ?? [])
                .whereType<String>() // Ensure that all elements are Strings
                .toList();

            return  Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.menu, color: Colors.orange),
                        onPressed: () {
                          Scaffold.of(context).openDrawer(); // Use the Builder context
                        },
                      );
                    },
                  ),
                  title: Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      color: Colors.orange,
                      onPressed: () {
                        // Add functionality for notifications button
                      },
                    ),
                  ],
                ),
                drawer: Drawer(
                  child: Column(
                    children: [
                      // Drawer header with image
                      const UserAccountsDrawerHeader(
                        accountName: Text('User Name'),
                        accountEmail: Text('user@example.com'),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage('sales/a2020cf5-9244-4244-8b8b-46186a571545.jpg'),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.orange),
                        title: const Text('Home'),
                        onTap: () {
                          Navigator.pop(context); // Close drawer
                          // You are already on Home, so no need to navigate
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.category, color: Colors.orange),
                        title: const Text('Categories'),
                        onTap: () {
                          Navigator.pop(context); // Close drawer
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoryScreen()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person, color: Colors.orange),
                        title: const Text('Sign Up'),
                        onTap: () {
                          Navigator.pop(context); // Close drawer
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Create_account()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.login_rounded, color: Colors.orange),
                        title: const Text('Login'),
                        onTap: () {
                          Navigator.pop(context); // Close drawer
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login_view()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 200.0, // Example height
                          child: ImageSlider(
                            images: images2, // Ensure images is not null
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: HorizontalCategoryList(
                          categories: categories, // Ensure categories is not null
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Popular Products',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 250.0, // Example height for the list
                        child: PopularProductList(
                          products: state.products, // Ensure popularProducts is not null
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Flash Sale',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 250.0, // Example height for the list
                        child: PopularProductList(
                          products: state.products,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'You might like',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 1950, // Example height for grid view
                        child: ProductGridView(
                          products: state.products, // Ensure likeProducts is not null
                        ),
                      ),
                    ),
                  ],
                )
            );
          }
          else if(state is FetchProductFailure ){
            return  Text("Error${state.error}");
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
