import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/main.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/utils/utils.dart';
import 'package:share/share.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSavableAppBar(MessageManager(context).aboutApp),
      body: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: padding_8x),
                    child: GestureDetector(
                      child: _buildLogo(),
                      onTap: () {
                        AppReview.storeListing.then((onValue) {
                          print(onValue);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: padding_x),
                    child: Text(
                      MessageManager(context).appName,
                      style: TextStyle(
                          color: ThemManager().themColors().basic.text,
                          fontSize: ThemManager().fontSize().normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: padding_10x, left: padding_2x, right: padding_2x),
                    child: buildSegment([
                      buildItem(MessageManager(context).rateForUs,
                          onPressed: () {
                        AppReview.requestReview.then((onValue) {
                          print(onValue);
                        });
                      }),
                      buildItemDivder(),
                      buildItem(
                        MessageManager(context).shareWithFriendForUs,
                        onPressed: () {
                          Share.share(MessageManager(context).shareContent);
                        },
                      ),
                      buildItemDivder(),
                      buildItem(
                        MessageManager(context).onBoardingPage,
                        onPressed: () =>
                            Utils.push(context, LandingToOnBoardingPage()),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: padding_2x),
                child: Text(
                  MessageManager(context).appVersion,
                  style: TextStyle(
                    color: ThemManager().themColors().basic.text2,
                    fontSize: ThemManager().fontSize().small,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildLogo() {
    final size = 80.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage(
            "assets/icons/icon.jpg",
          ),
        ),
      ),
    );
  }
}
