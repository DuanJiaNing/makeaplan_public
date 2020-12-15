import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';

typedef NumberChangeCallback = void Function(int oldNum, int newNum);

class NumberSelector extends StatelessWidget {
  static final int defaultMaxNumber = 999;

  final NumberChangeCallback callback;
  final String text;
  final int initNumber;
  final int maxNumber;

  const NumberSelector(
      {Key key,
      this.callback,
      this.text,
      this.initNumber = 0,
      this.maxNumber = 999})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildBtn(context, false),
        GestureDetector(
          onTap: () {
            _showNumberInputDialog(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding_x),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding_smallest),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ThemManager().themColors().basic.divider,
                    width: 0.5,
                  ),
                ),
              ),
              child: Text(
                text ?? "$initNumber",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: ThemManager().fontSize().middle,
                    color: ThemManager().themColors().basic.text),
              ),
            ),
          ),
        ),
        buildBtn(context, true),
      ],
    );
  }

  Widget buildBtn(BuildContext context, bool incre) {
    return GestureDetector(
      onLongPress: () {
        _showNumberInputDialog(context);
      },
      onTap: () {
        final newN =
            incre ? initNumber + 1 : (initNumber == 0 ? 0 : initNumber - 1);
        if (newN > maxNumber) {
          callback(newN, maxNumber);
          showToast(context,
              MessageManager(context).numberCanNotGreaterThan(maxNumber),
              toastType: MAPToast.failedAlert);
          return;
        }

        callback(initNumber, newN);
      },
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            color: ThemManager().themColors().colorfulButton.background,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ThemManager().themColors().colorfulButton.divider,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(radius_smallest))),
        child: Container(
          padding: EdgeInsets.only(bottom: padding_smallest),
          child: Text(
            incre ? "+" : "-",
            style: TextStyle(
                color: ThemManager().themColors().colorfulButton.icon,
                fontSize: ThemManager().fontSize().middle,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  _showNumberInputDialog(BuildContext context) {
    showNumberInputDialog(context, initNumber: initNumber, onConfirmed: (newN) {
      if (newN > maxNumber) {
        callback(initNumber, initNumber);
        showToast(
            context, MessageManager(context).numberCanNotGreaterThan(maxNumber),
            toastType: MAPToast.failedAlert);
        return;
      }

      callback(initNumber, newN);
    });
  }
}
