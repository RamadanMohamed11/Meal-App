import 'package:flutter/material.dart';
import 'package:meal_app/helper/extension.dart';
import 'package:meal_app/helper/tansitions.dart';
import 'package:meal_app/pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 50, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Coocking up...',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu, size: 28),
            title: Text('Meals', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 28),
            title: Text('Filter', style: TextStyle(fontSize: 20)),
            onTap: () {
              context.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FiltersPage()),
              // );

              context.push(
                CustomSizeTransition(
                  FiltersPage(),
                  alignment: Alignment.centerRight,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
