import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introKey = GlobalKey<_WelcomeScreenState>();

  void _onIntroEnd(context) async {
    //สร้าง Object แบบ SharedPreferences
    SharedPreferences sharedPrefernces = await SharedPreferences.getInstance();

    //เก็บค่าลงตัวแปรแบบ sharedPrefernces
    sharedPrefernces.setInt('appStep', 1);
    // เมื่อทำการเรียกไปหน้าสุด
    // ส่งไปหน้า dashboard
    Navigator.pushReplacementNamed(context, '/login'); //โหลดมาทัพหน้าแรก
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(
        'assets/images/welcome/$assetName.jpg',
        width: 350,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "เริ่มสร้างความมั่นคงทางการเงิน",
          body: "บริการทางการเงินที่ตอบโจทย์ทุกวัยกับเราได้แล้ววันนี้",
          image: _buildImage('onboard1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "เรียนรู้การให้เงินทำงาน",
          body: "ปล่อยให้เงินของคุณทำงานแทนคุณได้แล้ว",
          image: _buildImage('onboard2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('onboard3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('onboard4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "เริ่มทดลองใช้งานฟรี",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("เริ่มทดสอบระบบกับเราได้แล้ววันนี้", style: bodyStyle),
            ],
          ),
          image: _buildImage('onboard5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      // onSkip: () => _onIntroEnd(context), // You can override onSkip callback ถ้าไม่ใส่มันจะหน้า image สุดท้าย จะใส่จะไปหน้านั้นเลย
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
