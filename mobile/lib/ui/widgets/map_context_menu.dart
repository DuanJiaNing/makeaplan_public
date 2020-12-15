import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/context_menu/context_menu.dart';
import 'package:makeaplan/ui/widgets/context_menu/context_menu_action.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/utils/utils.dart';

class MAPContextMenu extends StatelessWidget {
  final Widget child;
  final List<SheetAction> actions;
  final String title;
  final String note;
  final bool isTask;
  final DateTime startTime;
  final DateTime endTime;

  const MAPContextMenu(
      {Key key,
      this.actions,
      this.title,
      this.note,
      this.isTask = false,
      this.startTime,
      this.endTime,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      child: child,
      previewBuilder: (context, animation, child) {
        return Material(
          color: ThemManager().themColors().dialog.background,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Scrollbar(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: padding_3x),
              child: SingleChildScrollView(
                child: Container(
                  child: buildTitleAndNote(
                    title,
                    note,
                    unlimitedMaxLines: true,
                    showTipWhenEmptyNote: true,
                    divider: TimeRange(
                      showIcon: true,
                      displayAsTime: isTask,
                      startTime: startTime,
                      endTime: endTime,
                      fontSize: ThemManager().fontSize().normal,
                      color: ThemManager().themColors().basic,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      actions: _buildCupertinoContextMenuAction(context),
    );
  }

  _buildCupertinoContextMenuAction(BuildContext context) {
    List<CupertinoContextMenuAction> results = List();
    List<SheetAction> acs = actions;
    if (Utils.emptyList(actions)) {
      acs = List();
      acs.add(
          SheetAction(MessageManager(context).archivedPlanNotEditable, null));
    }

    for (var i = 0; i < acs.length; i++) {
      final a = acs[i];
      results.add(CupertinoContextMenuAction(
        showDivider: i < acs.length - 1,
        child: Text(
          a.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: ThemManager().themColors().basic.text,
            fontSize: ThemManager().fontSize().large,
          ),
        ),
        onPressed: (ctx) {
          if (a.action == null) {
            return;
          }

          Navigator.pop(ctx);
          Future.delayed(Duration(
                  milliseconds:
                      duration_milliseconds_wait_for_context_menu_hide))
              .then((value) {
            a.action();
          });
        },
      ));
    }
    return results;
  }
}
