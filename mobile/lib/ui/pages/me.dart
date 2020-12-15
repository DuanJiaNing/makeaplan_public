import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/greeter_service.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/about.dart';
import 'package:makeaplan/ui/pages/account.dart';
import 'package:makeaplan/ui/pages/archived_plan.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/ui/pages/font_size_setting.dart';
import 'package:makeaplan/ui/pages/help_feedback.dart';
import 'package:makeaplan/ui/pages/them_setting.dart';
import 'package:makeaplan/ui/widgets/map_switcher.dart';
import 'package:makeaplan/utils/utils.dart';

class MePage extends StatefulWidget {
  final ValueNotifier<int> refreshNotifier;
  final VoidCallback onRefresh;

  const MePage({Key key, this.refreshNotifier, this.onRefresh})
      : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  int _archivedPlanCount;
  String _username;

  @override
  void initState() {
    super.initState();

    widget.refreshNotifier?.addListener(_onRefresh);
    _onRefresh();
  }

  _notifyParentRefresh() {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
  }

  _onRefresh() async {
    setState(() {
      _archivedPlanCount = null;
    });

    final value = await PlanService().queryPlanCount();
    setState(() {
      _archivedPlanCount = value.archivedPlanCount;
    });

    final up = await GreeterService().getUserProfile();
    setState(() {
      _username = up.username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: padding_4x),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + padding_2x,
                    left: padding_2x,
                    right: padding_2x),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: _builduserIcon(),
                      onTap: () => Utils.push(
                          context,
                          AccountPage(
                            onRefresh: () => _onRefresh(),
                          )),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: padding_2x),
                        child: _buildUsername(),
                      ),
                    )
                  ],
                ),
              ),

              /// 归档计划
              Container(
                padding: EdgeInsets.only(
                    top: padding_4x, left: padding_2x, right: padding_2x),
                child: buildSegment([
                  buildItem(
                    MessageManager(context).account,
                    onPressed: () => Utils.push(
                        context,
                        AccountPage(
                          onRefresh: () => _onRefresh(),
                        )),
                  ),
                  buildItemDivder(),
                  buildItem(
                    MessageManager(context).archivedPlan,
                    onPressed: () {
                      if (_archivedPlanCount == null ||
                          _archivedPlanCount == 0) {
                        showToast(context, MessageManager(context).noData);
                      } else {
                        Utils.push(context, ArchivedPlanPage(
                          onRefresh: () {
                            _notifyParentRefresh();
                            _onRefresh();
                          },
                        ));
                      }
                    },
                    trailing: Padding(
                      padding: EdgeInsets.only(right: padding_x),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: ThemManager()
                              .themColors()
                              .settingPanel
                              .background2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius_3x),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: padding_middle, vertical: 0),
                        child: _archivedPlanCount == null
                            ? null
                            : Text(
                                "$_archivedPlanCount",
                                style: TextStyle(
                                  color: ThemManager()
                                      .themColors()
                                      .settingPanel
                                      .text,
                                  fontSize: ThemManager().fontSize().middle,
                                ),
                              ),
                      ),
                    ),
                  ),
                ]),
              ),

              /// 1. 主题
              /// 1. 字体大小
              /// 3. 夜间模式
              Padding(
                padding: EdgeInsets.only(
                    top: padding_4x, left: padding_2x, right: padding_2x),
                child: buildSegment([
                  buildItem(
                    MessageManager(context).theme,
                    onPressed: () {
                      Utils.push(context, ThemSettingPage());
                    },
                    trailing: buildThemStub(ThemManager().themMode),
                  ),
                  buildItemDivder(),
                  buildItem(
                    MessageManager(context).fontSize,
                    onPressed: () {
                      Utils.push(context, FontSizeSettingPage());
                    },
                    trailing: Container(
                      padding: EdgeInsets.only(right: padding_x),
                      child: Text(
                        MessageManager(context).appFontSize(),
                        style: TextStyle(
                          color: ThemManager().themColors().settingPanel.text2,
                          fontSize: ThemManager().fontSize().middle,
                        ),
                      ),
                    ),
                  ),
                  buildItemDivder(),
                  ThemeSwitcher(
                    builder: (ctx) {
                      return buildItem(
                        MessageManager(context).darkMode,
                        onPressed: () {
                          _switchMode(ctx);
                        },
                        showArrowRight: false,
                        trailing: MAPSwitcher(
                          on: ThemManager().darkModeOn,
                          onChanged: (v) {
                            _switchMode(ctx);
                          },
                        ),
                      );
                    },
                  ),
                ]),
              ),

              /// 1. 帮助与反馈
              /// 2. 给我们评分
              /// 3. 分享给朋友
              /// 4. 关于：服务条款，隐私政策，版本信息
              Padding(
                padding: EdgeInsets.only(
                  top: padding_4x,
                  left: padding_2x,
                  right: padding_2x,
                  bottom: padding_8x,
                ),
                child: buildSegment([
                  buildItem("帮助与反馈",
                      onPressed: () => Utils.push(context, HelpFeedbackPage())),
                  buildItemDivder(),
                  buildItem("关于",
                      onPressed: () => Utils.push(context, AboutPage())),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _builduserIcon() {
    return Container(
      decoration: ShapeDecoration(
          color: ThemManager().themColors().basic.background2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding_2x))),
      padding: EdgeInsets.all(padding_2x),
      child: SvgPicture.asset(IconManager().user3Line,
          color: ThemManager().themColors().basic.icon),
    );
  }

  _buildUsername() {
    Widget text = Text(
      "$_username",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: ThemManager().themColors().basic.text,
          fontSize: ThemManager().fontSize().large),
    );
    if (Utils.emptyString(_username)) {
      text = GestureDetector(
        onTap: _showInputDialog,
        child: Text(
          MessageManager(context).clickToSetupUsername,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              color: ThemManager().themColors().basic.text2,
              fontSize: ThemManager().fontSize().larger),
        ),
      );
    }
    return text;
  }

  _showInputDialog() {
    showUsernameUpdateDialog(
      context,
      _username,
      (value) {
        showToast(context, MessageManager(context).updateSuccess);
        _onRefresh();
      },
    );
  }

  _switchMode(BuildContext context) {
    // 不需要使用 setState 更新，ThemeSwitcher 会负责进行重绘
    final tm = ThemManager();
    tm.updateDarkMode(context, !tm.darkModeOn);
  }
}
