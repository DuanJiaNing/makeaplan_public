import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/widgets/rounded_outline_button.dart';
import 'package:makeaplan/utils/utils.dart';

undrawNotifyRe65on() {
  final c1 =
      Utils.colorAsString(ThemManager().themColors().illustration.primary);
  // 土地
  final c2 =
      Utils.colorAsString(ThemManager().themColors().illustration.background2);
  // 线条
  final c3 =
      Utils.colorAsString(ThemManager().themColors().illustration.divider);

  return '''
  <svg id="ad6b5295-7ebf-4dc3-a7a8-a4a4b8d35fca" data-name="Layer 1"
    xmlns="http://www.w3.org/2000/svg" width="790" height="512.20805" viewBox="0 0 790 512.20805">
    <path
        d="M925.56335,704.58909,903,636.49819s24.81818,24.81818,24.81818,45.18181l-4.45454-47.09091s12.72727,17.18182,11.45454,43.27273S925.56335,704.58909,925.56335,704.58909Z"
        transform="translate(-205 -193.89598)" fill="${c2}" />
    <path
        d="M441.02093,642.58909,419,576.13509s24.22155,24.22155,24.22155,44.09565l-4.34745-45.95885s12.42131,16.76877,11.17917,42.23245S441.02093,642.58909,441.02093,642.58909Z"
        transform="translate(-205 -193.89598)" fill="${c2}" />
    <path
        d="M784.72555,673.25478c.03773,43.71478-86.66489,30.26818-192.8092,30.35979s-191.53562,13.68671-191.57335-30.028,86.63317-53.29714,192.77748-53.38876S784.68782,629.54,784.72555,673.25478Z"
        transform="translate(-205 -193.89598)" fill="${c2}" />
    <rect y="509.69312" width="790" height="2" fill="${c3}" />
    <circle cx="361.7217" cy="403.5046" r="62.98931" fill="${c1}" />
    <path
        d="M524.65625,529.9355a45.15919,45.15919,0,0,1-41.25537-26.78614L383.44873,278.05757a59.83039,59.83039,0,1,1,111.87012-41.86426l72.37744,235.41211a45.07978,45.07978,0,0,1-43.04,58.33008Z"
        transform="translate(-205 -193.89598)" fill="${c1}" />
</svg>
  ''';
}

class UnexpectedHappen extends StatelessWidget {
  final VoidCallback onRefresh;
  final String text;

  const UnexpectedHappen({
    Key key,
    this.onRefresh,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.string(
            undrawNotifyRe65on(),
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: padding_2x),
            child: SelectableText(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemManager().themColors().basic.text2,
                fontSize: ThemManager().fontSize().middle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: padding_3x),
            child: onRefresh == null
                ? null
                : RoundedOutlineButton(
                    title: "刷新",
                    onPressed: onRefresh,
                  ),
          ),
        ],
      ),
    );
  }
}
