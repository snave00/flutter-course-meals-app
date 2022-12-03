import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 10,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    final mealData = DUMMY_MEALS.firstWhere((item) => item.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: const Icon(
          Icons.delete,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.network(
              mealData.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(mealData.ingredients[index]),
                    ),
                  );
                },
                itemCount: mealData.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(mealData.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: mealData.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
