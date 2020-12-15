import 'package:flutter/material.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/ui/widgets/imgnotice/ap.dart';

class MAPToast extends StatelessWidget {
  static final successAlert = 1;
  static final failedAlert = 2;
  static final inProgressAlert = 3;

  final int toastType;
  final String msg;

  const MAPToast({Key key, this.toastType, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 4 * padding_2x,
      alignment: Alignment.center,
      child: Container(
        decoration: ShapeDecoration(
          color: ThemManager().themColors().basic.background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius_2x))),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: padding_middle, horizontal: padding_3x),
          decoration: ShapeDecoration(
            color: ThemManager().themColors().toast.background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius_2x))),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  msg,
                  style: TextStyle(
                      color: ThemManager().themColors().toast.text,
                      fontSize: ThemManager().fontSize().large,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                child: buildLeading(),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildLeading() {
    var v;
    if (toastType == successAlert) {
      v = Icon(
        Icons.assistant_photo,
        size: icon_size_4x,
        color: ThemManager().themColors().toast.icon,
      );
    }

    if (toastType == failedAlert) {
      v = Icon(
        Icons.warning,
        size: icon_size_4x,
        color: ThemManager().themColors().toast.icon,
      );
    }

    if (toastType == inProgressAlert) {
      v = Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
              ThemManager().themColors().toast.icon),
        ),
      );
    }

    return v == null
        ? Container(
            height: icon_size_4x,
          )
        : Container(
            padding: EdgeInsets.only(left: padding_middle),
            child: v,
          );
  }
}
