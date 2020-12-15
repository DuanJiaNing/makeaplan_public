import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/main.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/greeter_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/common.dart';
import 'package:makeaplan/utils/utils.dart';

class AccountPage extends StatefulWidget {
  final VoidCallback onRefresh;

  const AccountPage({Key key, this.onRefresh}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _showDataCode = false;
  String _dataCode = "unknown";
  String _username;

  @override
  void initState() {
    super.initState();
    init();
  }

  _notifyParentRefresh() {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
  }

  init() async {
    final value = await GreeterService().getUserProfile();
    setState(() {
      _dataCode = value.dataID;
      _username = value.username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSavableAppBar(MessageManager(context).account),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: padding_4x,
            top: padding_x,
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: padding_2x,
                  right: padding_2x,
                ),
                child: buildSegment(<Widget>[
                  buildItem(
                    MessageManager(context).username,
                    onPressed: _onUsernameUpdatePressed,
                    trailing: Row(
                      children: [
                        Text(
                          Utils.emptyString(_username)
                              ? MessageManager(context).clickToSetup
                              : _username,
                          style: TextStyle(
                            color:
                                ThemManager().themColors().settingPanel.text2,
                            fontSize: ThemManager().fontSize().normal,
                          ),
                        ),
                        Container(
                          width: padding_2x,
                        ),
                        buildEditButton()
                      ],
                    ),
                    showArrowRight: false,
                  ),
                  buildItemDivder(),
                  buildItem(MessageManager(context).goBackToStartPage,
                      onPressed: () {
                    Utils.pushAndRemoveUntil(context, LandingToStartUsePage());
                  }),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: padding_3x,
                  left: padding_2x,
                  right: padding_2x,
                ),
                child: buildSegment(<Widget>[
                  Container(
                    padding: EdgeInsets.all(padding_2x),
                    child: Text(
                      MessageManager(context).alertForAccountContent,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 100,
                      style: TextStyle(
                        letterSpacing: letter_spacing,
                        color: ThemManager().themColors().settingPanel.text2,
                        fontSize: ThemManager().fontSize().middle,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: padding_3x,
                      right: padding_3x,
                    ),
                    child: _buildDataId(context),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: padding_x,
                      left: padding_3x,
                      right: padding_3x,
                      bottom: padding_2x,
                    ),
                    alignment: Alignment.centerLeft,
                    child: _buildDataIdTip(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDataId(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Stack(
              children: <Widget>[
                Offstage(
                  offstage: _showDataCode,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDataCode = true;
                      });
                      _autoHide();
                    },
                    child: _buildText(
                      MessageManager(context).clickToCheck,
                      ThemManager().themColors().settingPanel.background2,
                      Colors.transparent,
                      ThemManager().themColors().settingPanel.text2,
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_showDataCode,
                  child: Container(
                    child: _buildText(
                      _dataCode,
                      Colors.transparent,
                      ThemManager().themColors().settingPanel.divider,
                      ThemManager().themColors().settingPanel.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: padding_x),
          child: MaterialButton(
            child: Text(MessageManager(context).copy,
                style: TextStyle(
                    fontSize: ThemManager().fontSize().normal,
                    color: ThemManager().themColors().settingPanel.text2)),
            onPressed: () {
              FlutterClipboard.copy(_dataCode).then((value) =>
                  showToast(context, MessageManager(context).copied));
            },
          ),
        ),
      ],
    );
  }

  Text _buildDataIdTip() {
    return Text(
      MessageManager(context).keepYouDataIDSecret,
      style: TextStyle(
          fontSize: ThemManager().fontSize().small,
          color: ThemManager().themColors().settingPanel.text),
    );
  }

  _buildText(
      String text, Color backgroundColor, Color outlineColor, Color textColor) {
    return Container(
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
            fontSize: ThemManager().fontSize().middle, color: textColor),
      ),
      alignment: Alignment.center,
      padding:
          EdgeInsets.symmetric(vertical: padding_x, horizontal: padding_2x),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: outlineColor),
            borderRadius: BorderRadius.all(Radius.circular(radius_smallest))),
      ),
    );
  }

  _autoHide() async {
    await Future.delayed(Duration(seconds: 3));
    if (this.mounted) {
      setState(() {
        _showDataCode = false;
      });
    }
  }

  _onUsernameUpdatePressed() {
    showUsernameUpdateDialog(
      context,
      _username,
      (value) {
        _notifyParentRefresh();

        showToast(context, MessageManager(context).updateSuccess);
        init();
      },
    );
  }
}
