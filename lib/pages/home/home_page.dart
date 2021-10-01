import 'package:flutter/material.dart';
import 'package:flutter_food/pages/FoodPage.dart';
import 'package:flutter_food/pages/login/login_page.dart';

import '../ProfilePage.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedBottomNavIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  Text('Chananya Aiamprakhon'),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood), 'Food'),
                onTap: (){ Navigator.pushNamed(context, FoodPage.routeName);}
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.shopping_cart), 'Profile'),
              onTap: () => _showSubPage(3),
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return FoodPage();
      case 1:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}
