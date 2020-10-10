import 'package:HeroServiceApp/screens/bottomnav/home_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Service'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business_center,
                color: Colors.white,
              ),
              label: 'บริการ'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: 'ตลาด'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business_center,
                color: Colors.white,
              ),
              label: 'รายการจอง'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              label: 'อื่นๆ'),
        ],
        selectedItemColor: Colors.white,
        // onTap: _onItemTapped,
      ),
      body: HomeScreen(),
    );
  }
}
