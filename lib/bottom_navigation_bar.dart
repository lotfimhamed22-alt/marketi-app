import 'package:flutter/material.dart';
import 'package:marketi/features/Home/presentation/view/screen/home_page.dart';

class BottomNavigationBarR extends StatefulWidget {
  const BottomNavigationBarR({super.key});

  @override
  State<BottomNavigationBarR> createState() => _BottomNavigationBarRState();
}

class _BottomNavigationBarRState extends State<BottomNavigationBarR> {
  int selectIndex = 0;

  final List<Widget> products = [
    HomePage(),
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.pink),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectIndex = value;
          setState(() {});
        },
        currentIndex: selectIndex,
        backgroundColor: Color(0xff242A32),
        selectedItemColor: Color(0xff0296E5),
        unselectedItemColor: Color(0xff67686D),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
