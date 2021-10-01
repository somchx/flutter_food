import 'package:flutter/material.dart';

import 'FoodPage.dart';

class ProfilePage extends StatelessWidget {
  static var routeName ='/profile';

  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
      ),
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
                onTap: (){ Navigator.pushNamed(context, ProfilePage.routeName);}
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  child: Image.asset('assets/images/dog.jpg'),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Chananya Aiamprakhon',style: Theme.of(context).textTheme.headline1),
            ),
            Text('aiamprakhon_c@silpakorn.edu',style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
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
