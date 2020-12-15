import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/utils/utils.dart';

apsvg() {
  final c1 = Utils.colorAsString(ThemManager().themColors().basic.primary);
  final c2 = Utils.colorAsString(ThemManager().themColors().basic.icon);

  return '''
 <svg id="e3553d74-0590-491b-b28e-952d4d1eac83" data-name="Layer 1"
    xmlns="http://www.w3.org/2000/svg" width="672.5315" height="738.39398" viewBox="0 0 130 130">
    <circle cx="63.694" cy="76.292" r="42.012" fill="${c2}"></circle>
    <rect x="565.936" y="563.554" width="22.868" height="12.763"
        transform="matrix(0.894146, -0.447775, 0.447775, 0.894146, -731.103943, -136.353775)"
        fill="${c2}"></rect>
    <ellipse cx="563.82" cy="573.748" rx="3.989" ry="10.636"
        transform="matrix(0.550463, -0.83486, 0.83486, 0.550463, -762.558443, 273.416732)"
        fill="${c2}"></ellipse>
    <rect x="617.672" y="558.502" width="12.763" height="22.868"
        transform="matrix(0.447775, -0.894146, 0.894146, 0.447775, -702.005371, 417.513397)"
        fill="${c2}"></rect>
    <ellipse cx="637.604" cy="573.748" rx="10.636" ry="3.989"
        transform="matrix(0.83486, -0.550463, 0.550463, 0.83486, -747.550235, -9.488721)"
        fill="${c2}"></ellipse>
    <circle cx="60.753" cy="66.015" r="14.359" fill="#fff"></circle>
    <ellipse cx="597.87" cy="515.084" rx="4.766" ry="4.8"
        transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -726.124992, 118.407017)"
        fill="#3f3d56"></ellipse>
    <path
        d="M 96.836 30.587 C 97.468 15.033 84.063 1.859 66.895 1.162 C 49.728 0.464 35.298 12.508 34.666 28.061 C 34.035 43.615 45.968 47.149 63.136 47.846 C 80.304 48.544 96.204 46.14 96.836 30.587 Z"
        fill="${c1}"></path>
    <ellipse cx="644.388" cy="537.568" rx="6.594" ry="21.006"
        transform="matrix(0.758758, -0.651372, 0.651372, 0.758758, -731.72213, 94.205441)"
        fill="${c2}"></ellipse>
    <ellipse cx="557.154" cy="537.568" rx="21.006" ry="6.594"
        transform="matrix(0.651372, -0.758758, 0.758758, 0.651372, -750.663387, 154.940641)"
        fill="${c2}"></ellipse>
    <path
        d="M 75.233 92.848 C 76.553 100.098 69.529 106.058 62.591 103.576 C 59.371 102.424 57.01 99.642 56.398 96.277 L 56.394 96.259 C 55.452 91.056 59.475 89.216 64.677 88.274 C 69.879 87.332 74.291 87.646 75.233 92.848 Z"
        fill="#fff"></path>
</svg>
  ''';
}

class Ap extends StatelessWidget {
  final double size;

  const Ap({
    Key key,
    this.size = icon_size_5x,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.string(
        apsvg(),
        height: size,
      ),
    );
  }
}
