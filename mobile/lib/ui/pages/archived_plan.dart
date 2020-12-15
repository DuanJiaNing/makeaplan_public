import 'package:flutter/material.dart';
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/them/consts.dart';
import 'package:makeaplan/manager/them/them_manager.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/archived_plan_detail.dart';
import 'package:makeaplan/ui/widgets/imgnotice/server_unavailable.dart';
import 'package:makeaplan/ui/widgets/map_scaffold.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';
import 'package:makeaplan/ui/widgets/time_range.dart';
import 'package:makeaplan/ui/widgets/title_text.dart';
import 'package:makeaplan/utils/utils.dart';

class ArchivedPlanPage extends StatefulWidget {
  final VoidCallback onRefresh;

  const ArchivedPlanPage({Key key, this.onRefresh}) : super(key: key);

  @override
  _ArchivedPlanPageState createState() => _ArchivedPlanPageState();
}

class _ArchivedPlanPageState extends State<ArchivedPlanPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<pb.Plan> _plans;
  bool _serverUnavailable = false;

  @override
  void initState() {
    super.initState();

    _doLoadPlans();
  }

  _notifyParentRefresh() {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MAPScaffold(
      onRefresh: _doLoadPlans,
      body: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(left: padding_x, right: padding_2x),
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemManager().themColors().planCard.icon,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: padding_3x),
            child: TitleText(
              title: MessageManager(context).archivedPlan,
            ),
          ),
        ],
      ),
    );
  }

  _buildServerUnavailable() {
    return Center(
      child: UnexpectedHappen(
        text: MessageManager(context).serverUnavailable,
        onRefresh: _doLoadPlans,
      ),
    );
  }

  _buildBody() {
    if (_serverUnavailable) {
      return _buildServerUnavailable();
    }

    return _plans == null
        ? buildStubText(MessageManager(context).inLoading)
        : _buildList();
  }

  _buildList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: padding_4x, top: padding_x),
      child: AnimatedList(
        key: _listKey,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        initialItemCount: _plans.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(animation, index);
        },
      ),
    );
  }

  _buildItem(Animation<double> animation, int index) {
    final item = _buildListItem(index);

    return SlideTransition(
      position: animation.drive(Tween(
        begin: Offset.zero.translate(0, 0.5),
        end: Offset.zero.translate(0, 0.0),
      )),
      child: FadeTransition(
        opacity: animation,
        child: item,
      ),
    );
  }

  _buildListItem(int index) {
    final p = _plans[index];
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: padding_2x, vertical: padding_x),
      child: FlatButton(
        color: ThemManager().themColors().archivedPlanCard.background,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 0,
                color:
                    ThemManager().themColors().archivedPlanCard.outerDivider),
            borderRadius: BorderRadius.circular(radius_x)),
        onPressed: () {
          _onPressed(index);
        },
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: padding_x, vertical: padding_2x),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      p.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ThemManager().themColors().archivedPlanCard.text,
                        fontSize: ThemManager().fontSize().large,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: icon_size_2x,
                    color: ThemManager().themColors().archivedPlanCard.icon,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: padding_x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TimeRange(
                      fontSize: ThemManager().fontSize().small,
                      showOneDayPlanHit: true,
                      color: ThemManager().themColors().archivedPlanCard
                        ..text =
                            ThemManager().themColors().archivedPlanCard.text2,
                      startTime: Utils.pb2DateTime(p.startTime),
                      endTime: Utils.pb2DateTime(p.endTime),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: padding_x),
                      child: Text(
                        MessageManager(context)
                            .archivedAt(Utils.pb2DateTime(p.updateTime)),
                        style: TextStyle(
                          color:
                              ThemManager().themColors().archivedPlanCard.text2,
                          fontSize: ThemManager().fontSize().small,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _doLoadPlans() {
    setState(() {
      _plans = null;
      _serverUnavailable = false;
    });

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => PlanService().queryArchivedPlan(),
      onSuccess: (value) {
        _loadPlans(value);
      },
      onError: (e) {
        handleError(context, e, noDataFound: () {
          Navigator.of(context).pop(true);
        }, unavailable: () {
          showToast(context, "服务不可用！", toastType: MAPToast.failedAlert);
          setState(() {
            _serverUnavailable = true;
          });
        });
      },
    );
  }

  _onPressed(int index) {
    Utils.push(
        context,
        ArchivedPlanDetailPage(
          planID: _plans[index].id,
          onRefresh: () {
            _notifyParentRefresh();
            _doLoadPlans();
          },
        ));
  }

  Future<void> _loadPlans(List<pb.Plan> ps) async {
    if (_plans == null) {
      setState(() {
        _plans = List();
      });
    }
    for (var item in ps) {
      await Future.delayed(Duration(milliseconds: 100));
      var insertIndex = _plans.length;
      _plans.add(item);
      _listKey.currentState.insertItem(insertIndex,
          duration:
              Duration(milliseconds: duration_milliseconds_list_item_anim));
    }
  }
}
