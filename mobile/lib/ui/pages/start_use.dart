import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:makeaplan/main.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/preference/selected_plan.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/greeter_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/widgets/inprogress_mask.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class StartUsePage extends StatefulWidget {
  @override
  _GetCaptchaPageState createState() => _GetCaptchaPageState();
}

class _GetCaptchaPageState extends State<StartUsePage> {
  bool _startInProgress = false;
  bool _haveAccount = false;
  bool _reachQuota = false;

  @override
  void initState() {
    super.initState();

    GreeterService()
        .sayHello()
        .catchError((err) => handleError(context, err))
        .then((success) {
      setState(() {
        _haveAccount = success;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildContent(),
        InProgressOffstage(
          inProgress: _startInProgress,
        ),
      ],
    );
  }

  _buildContent() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: padding_8x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: _buildTitle(),
            ),
            Container(
              padding: EdgeInsets.only(
                top: padding_6x,
              ),
              child: _buildButton(),
            ),
            Container(
              padding: EdgeInsets.only(
                top: padding_3x,
              ),
              child: _buildBottom(),
            ),
            Container(
              padding: EdgeInsets.only(
                top: padding_6x,
                left: padding_6x,
                right: padding_6x,
              ),
              child: _reachQuota ? _buildReachQuota() : null,
            ),
          ],
        ),
      ),
    );
  }

  _buildReachQuota() {
    return Text(
      MessageManager(context).maxRetryOfRecoverDataCountReached(),
      style: TextStyle(
        color: ThemManager().themColors().basic.text2,
        fontSize: ThemManager().fontSize().large,
      ),
    );
  }

  Row _buildBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () => _launchPrivacyPolicy(),
          child: Text(
            MessageManager(context).privacyPolicy,
            style: TextStyle(
              color: ThemManager().themColors().basic.text2,
              fontSize: ThemManager().fontSize().middle,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding_smallest),
          child: Container(
            width: 1,
            height: 10,
            color: ThemManager().themColors().basic.divider,
          ),
        ),
        GestureDetector(
          onTap: _recoverData,
          child: Text(
            MessageManager(context).recoverData,
            style: TextStyle(
              color: ThemManager().themColors().basic.primary,
              fontSize: ThemManager().fontSize().middle,
            ),
          ),
        ),
      ],
    );
  }

  MaterialButton _buildButton() {
    return MaterialButton(
      padding:
          EdgeInsets.symmetric(vertical: padding_2x, horizontal: padding_10x),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.5,
              color: ThemManager().themColors().colorfulButton.divider),
          borderRadius: BorderRadius.circular(radius_x)),
      onPressed: _haveAccount ? _continue : _start,
      color: ThemManager().themColors().colorfulButton.background,
      disabledColor: ThemManager().themColors().colorfulButton.disabled,
      elevation: 0,
      highlightElevation: 0,
      child: Text(
        _haveAccount
            ? MessageManager(context).enterApp
            : MessageManager(context).startToUseApp,
        style: TextStyle(
            color: ThemManager().themColors().colorfulButton.text,
            fontSize: ThemManager().fontSize().larger,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      MessageManager(context).readyToMakeAPlan,
      style: TextStyle(
          color: ThemManager().themColors().basic.text,
          fontSize: ThemManager().fontSize().largest,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none),
    );
  }

  _recoverData() {
    if (_reachQuota) {
      clearToastMark();
      showNoticeDialog(
          context, MessageManager(context).maxRetryOfRecoverDataCountReached());
      return;
    }

    final TextEditingController _textEditingController =
        TextEditingController();
    showInputDialog(
      context,
      MessageManager(context).recoverData,
      _textEditingController,
      hint: MessageManager(context).inputDataIDForDataRecover,
      onConfirmed: () => _updateDeviceId(_textEditingController.text),
      confirmText: MessageManager(context).goOn,
    );
  }

  _updateDeviceId(String ipt) async {
    if (ipt.length != data_id_length) {
      showNoticeDialog(
          context, MessageManager(context).inputDataIDWithNumberAndLetters);
      return;
    }

    setState(() {
      _startInProgress = true;
    });
    var ft = showToast(context, MessageManager(context).inRecoving,
        toastType: MAPToast.inProgressAlert);
    fin() {
      removeCustomToast(ft);
      setState(() {
        _startInProgress = false;
      });
    }

    GreeterService().updateDeviceID(ipt).then((value) async {
      fin();

      showToast(context, MessageManager(context).recoverSuccess,
          toastType: MAPToast.successAlert);
      await SelectedPlanManager().reset();
      Utils.pushReplacement(context, LandingToHomePage());
    }).catchError((e) {
      fin();

      final err = e as grpc.GrpcError;
      if (err.code == 2 && err.message == "record Not Found") {
        showToast(context, MessageManager(context).invalidDataID,
            toastType: MAPToast.failedAlert);
      } else if (err.code == 2 && err.message == "reach quota") {
        setState(() {
          _reachQuota = true;
        });
        showNoticeDialog(context,
            MessageManager(context).maxRetryOfRecoverDataCountReached());
      } else {
        handleError(context, e);
      }
    });
  }

  _continue() {
    Utils.pushReplacement(context, LandingToHomePage());
  }

  _start() async {
    setState(() {
      _startInProgress = true;
    });

    var ft = showToast(context, MessageManager(context).inProcessing,
        toastType: MAPToast.inProgressAlert);
    await Future.delayed(Duration(seconds: 1));
    await SelectedPlanManager().reset();
    await GreeterService().start();
    removeCustomToast(ft);

    ft = showToast(context, MessageManager(context).creatingPreSetPlan,
        toastType: MAPToast.inProgressAlert);
    await Future.delayed(Duration(seconds: 1));
    await GreeterService().initPerSetPlan(1);
    await GreeterService().initPerSetPlan(2);
    removeCustomToast(ft);
    Utils.pushReplacement(context, LandingToHomePage());
  }

  _launchPrivacyPolicy() async {
    if (await canLaunch(privacy_policy)) {
      await launch(privacy_policy);
    } else {
      FlutterClipboard.copy(privacy_policy).then((value) {
        showNoticeDialog(context,
            MessageManager(context).launchWebBrowserAppFailed(privacy_policy));
      });
    }
  }
}
