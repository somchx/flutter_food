import 'package:flutter/material.dart';
import 'package:flutter_food/pages/ProfilePage.dart';

class FoodPage extends StatefulWidget {
  static const routeName = '/food';

  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  var _subPageIndex = 0;
  static const List<Widget> _showText = <Widget>[
    Text(
      'FOOD MENU',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
    ),
    Text(
      'YOUR ORDER',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food'),),
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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/dog.jpg'),
                      )
                  ),
                  Text('Chananya Aiamprakhon',style: TextStyle(color: Colors.white),),
                  Text('aiamprakhon_c@silpakorn.edu',style: TextStyle(color: Colors.white),),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex, //ไฮไลท์ bottom icon
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;
            _subPageIndex=index;
          });
        },
      ),

      body: Center(
        child: _showText.elementAt(_selectedBottomNavIndex),
      ),

    );
  }
  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return Center(
          child: Text('THIS IS A HOME PAGE',
              style: Theme.of(context).textTheme.headline1),
        );
      case 1:
        return OrderPage();
      default:
        return SizedBox.shrink();
    }
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


class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER FOOD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'FOOD PAGE',
            style: Theme.of(context).textTheme.headline1,
          )),
        ],
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER FOOD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'ORDER PAGE',
            style: Theme.of(context).textTheme.headline1,
          )),
        ],
      ),
    );
  }
}
