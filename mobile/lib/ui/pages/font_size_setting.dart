import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/api/common.pb.dart' as pb;
import 'package:makeaplan/api/google/protobuf/timestamp.pb.dart' as pb;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/icon_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/font_size.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/model/plan_summary_todolist_task.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/ui/widgets/card/plan_summary_card.dart';

class FontSizeSettingPage extends StatefulWidget {
  @override
  _FontSizeSettingPageState createState() => _FontSizeSettingPageState();
}

class _FontSizeSettingPageState extends State<FontSizeSettingPage> {
  bool _modified = false;
  int _selectedMode;
  int _oldSelectedMode;

  @override
  void initState() {
    super.initState();

    _oldSelectedMode = ThemManager().fontSizeMode;
    _selectedMode = _oldSelectedMode;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (ctx) {
        return Scaffold(
          appBar: buildSavableAppBar(MessageManager(context).fontSize,
              onSavePressed: _modified
                  ? () {
                      _onSave(ctx);
                    }
                  : null),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: padding_x, left: padding_2x, right: padding_2x),
                    child: buildSegment([
                      buildItem(
                        MessageManager(context).fontSizeSmall,
                        showArrowRight: false,
                        trailing: _selectedMode == font_size_small
                            ? _buildCheckIcon()
                            : null,
                        onPressed: () {
                          _update(font_size_small);
                        },
                      ),
                      buildItemDivder(),
                      buildItem(
                        MessageManager(context).fontSizeStd,
                        showArrowRight: false,
                        trailing: _selectedMode == font_size_std
                            ? _buildCheckIcon()
                            : null,
                        onPressed: () {
                          _update(font_size_std);
                        },
                      ),
                      buildItemDivder(),
                      buildItem(
                        MessageManager(context).fontSizeMiddle,
                        showArrowRight: false,
                        trailing: _selectedMode == font_size_middle
                            ? _buildCheckIcon()
                            : null,
                        onPressed: () {
                          _update(font_size_middle);
                        },
                      ),
                      buildItemDivder(),
                      buildItem(
                        MessageManager(context).fontSizeLarge,
                        showArrowRight: false,
                        trailing: _selectedMode == font_size_large
                            ? _buildCheckIcon()
                            : null,
                        onPressed: () {
                          _update(font_size_large);
                        },
                      ),
                    ]),
                  ),
                  Container(
                    height: padding_4x,
                  ),
                  _buildPreviewStub(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildPreviewStub() {
    final fs = ThemManager().getFontSizeByMode(_selectedMode);
    return Container(
      color: ThemManager().themColors().topPanel.background,
      padding: EdgeInsets.only(
        top: padding_4x,
        bottom: padding_4x,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: padding_3x),
            alignment: Alignment.centerLeft,
            child: Text(
              MessageManager(context).preview,
              style: TextStyle(
                  color: ThemManager().themColors().basic.text,
                  fontSize: fs.largest,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: padding_x,
            ),
            child: buildItemDivder(),
          ),
          Container(
            padding: EdgeInsets.only(
              top: padding_2x,
            ),
            child: buildTitleAndNote(MessageManager(context).previewTitle,
                MessageManager(context).previewNote,
                fs: fs),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              top: padding_4x,
              left: padding_2x,
              right: padding_2x,
            ),
            child: PlanSummaryCard(
              fontSize: ThemManager().getFontSizeByMode(_selectedMode),
              planData: _getMockPlan(),
              active: false,
            ),
          ),
        ],
      ),
    );
  }

  _buildCheckIcon() {
    return Container(
      padding: EdgeInsets.only(right: padding_x),
      child: Icon(
        IconManager().check,
        size: icon_size_4x,
        color: ThemManager().themColors().basic.icon,
      ),
    );
  }

  _onSave(BuildContext context) async {
    await ThemManager().updateFontSize(context, _selectedMode);
    showToast(context, MessageManager(context).applied);
    setState(() {
      _modified = false;
      _oldSelectedMode = _selectedMode;
    });
  }

  _update(int nm) {
    setState(() {
      _modified = _oldSelectedMode != nm;
      _selectedMode = nm;
    });
  }

  _getMockPlan() {
    final p = pb.PlanSummary.create()..plan = pb.Plan.create();
    p.plan.title = MessageManager(context).previewTitle;
    p.plan.endTime = pb.Timestamp.fromDateTime(DateTime.now());
    p.plan.startTime =
        pb.Timestamp.fromDateTime(DateTime.now().subtract(Duration(days: 3)));
    p.plan.code = "A";
    p.status = pb.CommonStatus.FINISHED;

    return PlanSummaryWithTodoListTask()..planSummary = p;
  }
}
