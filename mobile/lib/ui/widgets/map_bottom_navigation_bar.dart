import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/colors.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';

typedef TabChangedCallback = Function(int oldPageIndex, int newPageIndex);

class MAPBottomNavigationBar extends StatelessWidget {
  final int mainPageIndex;
  final int mePageIndex;
  final int plansPageIndex;

  final int selectTab;
  final TabChangedCallback callback;

  final VoidCallback nextPlanOnPressed;
  final VoidCallback prePlanOnPressed;
  final String planCode;

  final bool needRefresh;
  final bool inLoading;
  final VoidCallback onRefresh;
  final VoidCallback onLongPress;

  const MAPBottomNavigationBar({
    Key key,
    this.mainPageIndex,
    this.mePageIndex,
    this.plansPageIndex,
    this.selectTab,
    this.callback,
    this.nextPlanOnPressed,
    this.prePlanOnPressed,
    this.planCode,
    this.needRefresh = false,
    this.onRefresh,
    this.onLongPress,
    this.inLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scWidth = MediaQuery.of(context).size.width;
    final otherUnselectedWidth = scWidth * 0.25;
    final mainSelectedWidth = scWidth * 0.4;

    final mainUnselectedWidth = scWidth * 0.2;
    final otherSelectedWidth = scWidth * 0.38;

    return BottomAppBar(
      elevation: 0,
      color: ThemManager().themColors().bottomNavigationBar.background,
      child: Container(
        height: bottom_navigation_bar_height,
        child: Padding(
          padding: EdgeInsets.only(
            top: padding_smallest,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: duration_milliseconds_std),
                width: mainPageIndex == selectTab
                    ? otherUnselectedWidth
                    : otherSelectedWidth,
                child: getIconButton(
                    IconManager().calendarTodoLine, plansPageIndex),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: duration_milliseconds_std),
                width: mainPageIndex == selectTab
                    ? mainSelectedWidth
                    : mainUnselectedWidth,
                child: getPlanSwitchButton(mainPageIndex),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: duration_milliseconds_std),
                width: mainPageIndex == selectTab
                    ? otherUnselectedWidth
                    : otherSelectedWidth,
                child: getIconButton(IconManager().user3Line, mePageIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getIconButton(String svgIcon, int cIndex) {
    return IconButton(
      onPressed: () {
        if (selectTab != cIndex) {
          callback(selectTab, cIndex);
        }
      },
      iconSize: bottom_navigation_bar_icon_size,
      icon: SvgPicture.asset(svgIcon,
          color: selectTab == cIndex
              ? ThemManager().themColors().bottomNavigationBar.iconFocus
              : ThemManager().themColors().bottomNavigationBar.icon),
    );
  }

  getPlanSwitchButton(int mainIndex) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: _buildArrowButton(IconManager().arrowLeft,
              onPressed: selectTab == mainIndex ? prePlanOnPressed : null),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _buildArrowButton(IconManager().arrowRight,
              onPressed: selectTab == mainIndex ? nextPlanOnPressed : null),
        ),
        Align(
          alignment: Alignment.center,
          child: _buildSelectedPlanButton(
              selectTab == mainIndex
                  ? ThemManager().themColors().bottomNavigationBarMainHighlight
                  : ThemManager().themColors().bottomNavigationBarMain, () {
            if (selectTab != mainIndex) {
              callback(selectTab, mainIndex);
              return;
            }

            if (needRefresh) {
              onRefresh();
              return;
            }
          }),
        ),
      ],
    );
  }

  Material _buildSelectedPlanButton(StyleColor color, onTap) {
    return Material(
      color: color.background,
      shape: CircleBorder(
        side: BorderSide(width: 2, color: color.divider),
      ),
      child: InkWell(
        customBorder: CircleBorder(),
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          height: 43,
          child: Center(
            child: _buildContent(color),
          ),
        ),
      ),
    );
  }

  _buildArrowButton(IconData iconData, {VoidCallback onPressed}) {
    return AnimatedOpacity(
      opacity: mainPageIndex == selectTab ? 1 : 0,
      duration: Duration(milliseconds: duration_milliseconds_std),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(0),
        icon: Icon(
          iconData,
          size: icon_size_5x,
          color: ThemManager().themColors().bottomNavigationBar.iconFocus,
        ),
      ),
    );
  }

  _buildContent(StyleColor color) {
    if (needRefresh) {
      return Icon(
        Icons.refresh,
        size: icon_size_4x,
        color: color.icon,
      );
    }

    if (inLoading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        strokeWidth: 8,
        valueColor: AlwaysStoppedAnimation<Color>(color.icon),
      );
    }

    String str = "...";
    if (planCode != null) {
      str = planCode;
    }
    return Text(
      str,
      style: TextStyle(
          color: color.text,
          fontSize: ThemManager().fontSize().larger,
          fontWeight: FontWeight.normal),
    );
  }
}
