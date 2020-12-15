import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/imgnotice/server_unavailable.dart';
import 'package:makeaplan/utils/grpc_error.dart';
import 'package:makeaplan/utils/utils.dart';

class ErrorPage extends StatefulWidget {
  final error;
  final text;
  final StackTrace stackTrace;
  final bool exitAppOnly;
  final bool printError;

  const ErrorPage({
    Key key,
    this.error,
    this.text,
    this.exitAppOnly = false,
    this.printError = false,
    this.stackTrace,
  }) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    String str = widget.text;
    if (Utils.emptyString(str)) {
      str = MessageManager(context).error(widget.error);
    }
    if (widget.printError && !knownError(widget.error)) {
      str += "\n请截图并发给管理员: $admin_email";
      str += "\n\n${widget.error}";
      if (widget.stackTrace != null) {
        str += "\n\n${widget.stackTrace}";
      }
    }

    return Scaffold(
      appBar: widget.exitAppOnly
          ? null
          : buildSavableAppBar(
              MessageManager(context).errorOccurred,
              onGoBack: () {
                inErrorPage = false;
                Navigator.pop(context);
              },
            ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 4,
            bottom: padding_4x,
            left: padding_2x,
            right: padding_2x,
          ),
          child: UnexpectedHappen(
            text: str,
          ),
        ),
      ),
    );
  }

  bool knownError(error) {
    if (GRPCError.unavailable(error)) {
      return true;
    }

    if (GRPCError.noDataFound(error)) {
      return true;
    }

    return false;
  }
}
