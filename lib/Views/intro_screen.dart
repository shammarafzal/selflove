import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return const Scaffold(
      body: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        // child: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 16, right: 16),
        //     child: _buildImage('self_logo.png', 100),
        //   ),
        // ),
      ),
      pages: [
        PageViewModel(
          title: "Choose the suitable class for you",
          body: "We have expert team a you can book with them your classes.",
          image: _buildImage('sp-1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Affordable and quality service",
          body:
              "Focused on bringing fast, affordable and quality service for you.",
          image: _buildImage('sp-2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Adults and teens",
          body: "Adults and teens can boost their confidence.",
          image: _buildImage('sp-3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      next: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blueAccent,
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
