import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Widget _buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Center(
              child: Text(
                'Cooking Up',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              AppRoutes.goToInitialScreen(context);
            },
          ),
          _buildListTile('Filters', Icons.filter, () {
            AppRoutes.goToFiltersScreen(context: context);
          }),
        ],
      ),
    );
  }
}
