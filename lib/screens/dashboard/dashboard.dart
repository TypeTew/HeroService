import 'package:HeroServiceApp/screens/bottomnav/booking_screen.dart';
import 'package:HeroServiceApp/screens/bottomnav/home_screen.dart';
import 'package:HeroServiceApp/screens/bottomnav/market_screen.dart';
import 'package:HeroServiceApp/screens/bottomnav/notification_screen.dart';
import 'package:HeroServiceApp/screens/bottomnav/setting_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //สร้างตัวแปรแบบ list ไว้เก็บรายการของ tabl bottom
  int _currentIndex = 2;
  String _title = "Hero Service";
  Widget _actionWidget;
  //String

  final List<Widget> _children = [
    MarketScreen(),
    BookingScreen(),
    HomeScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];
  // สร้าง Widget action สำหรับไว้แยกแสดงผล Appbar
  Widget _homeActionBar() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/qrcode');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Row(
          children: [Icon(Icons.center_focus_strong), Text(' SCAN')],
        ),
      ),
    );
  }

  Widget _marketActionBar() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [Icon(Icons.center_focus_strong), Text('Scan')],
      ),
    );
  }

  // สร้างฟังก์ชันเพื่อใช้ในการเปลี่ยนหน้า
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      // เปลี่ยน title ไปตาม tab ที่เลือก
      switch (index) {
        case 0:
          _title = 'ตลาด';
          _actionWidget = _marketActionBar();
          break;
        case 1:
          _title = 'รายการจอง';
          _actionWidget = Container();
          break;
        case 2:
          _title = 'หน้าหลัก';
          _actionWidget = _homeActionBar();
          break;
        case 3:
          _title = 'แจ้งเตือน';
          _actionWidget = Container();
          break;
        case 4:
          _title = 'อื่นๆ';
          _actionWidget = Container();
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _actionWidget = _homeActionBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('$_title'),
        actions: [_actionWidget],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _onTabTapped,
      //   currentIndex: _currentIndex, //กดที่ไหนก็ตามจะคืนค่า tab มาให้
      //   backgroundColor: Colors.teal,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.business_center,
      //           color: Colors.white,
      //         ),
      //         label: 'ตลาด'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.shopping_cart,
      //           color: Colors.white,
      //         ),
      //         label: 'รายการจอง'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.library_books,
      //           color: Colors.white,
      //         ),
      //         label: 'บริการ'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.menu,
      //           color: Colors.white,
      //         ),
      //         label: 'แจ้งเตือน'),
      //   ],
      //   selectedItemColor: Colors.white,
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.teal,
        buttonBackgroundColor: Colors.teal,
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        index: 2,
        animationCurve: Curves.bounceInOut,
        items: [
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.library_add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.business_center,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: onTabTapped,
      ),
      body: _children[_currentIndex],
    );
  }
}
