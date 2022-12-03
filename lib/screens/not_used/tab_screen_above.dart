import 'package:flutter/material.dart';
import '../../screens/categories_screen.dart';
import '../../screens/favorites_screen.dart';

/// This Widget is for reference only
/// Sample code for displaying the TabBar Above.
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.category), text: 'Category'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
            ],
            indicatorColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
