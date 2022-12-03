import 'package:flutter/material.dart';
import '../data/filters_data.dart';
import '../widgets/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  void switchOnChanged(int index, bool value) {
    setState(() {
      FILTER_SWITCH_TILE[index].filterState = value;
      FILTER_SWITCH_TILE.forEach((element) {
        print('Title ${element.title}. State: ${element.filterState}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return SwitchListTile(
                  title: Text(FILTER_SWITCH_TILE[index].title),
                  subtitle: Text(FILTER_SWITCH_TILE[index].subtitle),
                  value: FILTER_SWITCH_TILE[index].filterState,
                  onChanged: (value) {
                    switchOnChanged(index, value);
                  },
                );
              },
              itemCount: FILTER_SWITCH_TILE.length,
            ))
          ],
        ));
  }
}
