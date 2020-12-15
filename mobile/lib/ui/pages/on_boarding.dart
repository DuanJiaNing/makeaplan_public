import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:makeaplan/main.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/utils/utils.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Utils.pushReplacement(context, LandingToStartUsePage());
  }

  Widget _buildImage(String assetName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: padding_3x),
      child: Align(
        child: SvgPicture.asset(
          'assets/images/$assetName',
          width: 180,
          height: 180,
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, letterSpacing: letter_spacing);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          letterSpacing: letter_spacing),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "欢迎",
          body: "欢迎来到 \"制定一个计划\"，制定计划其实可以很简单...",
          image: _buildImage('undraw_Taken_re_yn20.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "开始之前",
          body: "在开始制定一个计划之前，静下心来，先找到正确的方向。",
          image: _buildImage('undraw_right_direction_tge8.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "记录",
          body: "然后，把想法记录下来，目标是什么？需要在什么时间内完成？",
          image: _buildImage('undraw_Freelancer_re_irh4.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "细化计划",
          body: "将计划拆解为多个阶段，再为每个阶段分配需要完成的任务。",
          image: _buildImage('undraw_Taking_notes_re_bnaf.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "执行",
          body: "朝着目标前进，只有计划是不够的，执行它们。️",
          image: _buildImage('undraw_bike_ride_7xit.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('跳过'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('继续', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFF6573F1),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
