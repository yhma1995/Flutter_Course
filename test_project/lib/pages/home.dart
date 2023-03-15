import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/pages/product/product.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: IndexedStack(
          index: index,
          children: [
          ProductPage(),
          Text('page cart'),
          Text('page fav'),
          Text('page profile'),
        ],),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:index,
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            index=value;
          });
         print(value);
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            label: 'shop',
            icon: Icon(Icons.shop),
          ),
          const BottomNavigationBarItem(
            label: 'cart',
            icon: Icon(Icons.shopping_cart),
          ),
          const BottomNavigationBarItem(
            label: 'favarit',
            icon: Icon(Icons.favorite),
          ),
          const BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
