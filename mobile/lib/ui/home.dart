import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:makeaplan/manager/i10n/message_manager.dart';
import 'package:makeaplan/manager/preference/selected_plan.dart';
import 'package:makeaplan/model/planid_code.dart';
import 'package:makeaplan/service/plan_service.dart';
import 'package:makeaplan/ui/common.dart';
import 'package:makeaplan/ui/pages/main/plan.dart';
import 'package:makeaplan/ui/pages/plans.dart';
import 'package:makeaplan/ui/widgets/map_bottom_navigation_bar.dart';
import 'package:makeaplan/ui/widgets/map_toast.dart';

import 'pages/me.dart';

class MyHomePage extends StatefulWidget {
  static final mainPageIndex = 0;
  static final plansPageIndex = 1;
  static final mePageIndex = 2;

  final selectTab;

  MyHomePage({Key key, this.selectTab}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<int> _planPageRefreshNotifier = ValueNotifier(null);
  ValueNotifier<int> _plansPageRefreshNotifier = ValueNotifier(null);
  ValueNotifier<int> _mePageRefreshNotifier = ValueNotifier(null);

  /// ////////////////////////////////////////////////////////////////////////// Status define
  int _selectTab = 0;
  PlanIDCode _selectedPlan;

  bool _noDataFound = false;
  bool _serverUnavailable = false;
  bool _inLoading = false;

  /// ////////////////////////////////////////////////////////////////////////// Overwrite
  @override
  void dispose() {
    super.dispose();
    _planPageRefreshNotifier.dispose();
    _plansPageRefreshNotifier.dispose();
    _mePageRefreshNotifier.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectTab = widget.selectTab ?? MyHomePage.mainPageIndex;

    _doLoadData();
  }

  _doLoadData() {
    setState(() {
      _selectedPlan = null;
      _noDataFound = false;
      _serverUnavailable = false;
    });

    startProgress(
      context,
      MessageManager(context).inLoading,
      () => SelectedPlanManager().initSelectedPlan(),
      onSuccess: (ps) {
        setState(() {
          _selectedPlan = ps;
        });
      },
      onDelayed: () {
        setState(() {
          _inLoading = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _inLoading = false;
        });
      },
      onError: _handleError,
    );
  }

  _handleError(e) {
    handleError(context, e, noDataFound: () {
      showToast(context, MessageManager(context).noData,
          toastType: MAPToast.failedAlert);
      setState(() {
        _noDataFound = true;
      });
    }, unavailable: () {
      showToast(context, MessageManager(context).serverUnavailable,
          toastType: MAPToast.failedAlert);
      setState(() {
        _serverUnavailable = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(child: Builder(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: _selectTab,
          children: <Widget>[
            _buildMainPage(),
            _buildPlansPage(),
            _buildMePage(),
          ],
        ),
        bottomNavigationBar: MAPBottomNavigationBar(
          inLoading: _inLoading,
          mainPageIndex: MyHomePage.mainPageIndex,
          mePageIndex: MyHomePage.mePageIndex,
          plansPageIndex: MyHomePage.plansPageIndex,
          selectTab: _selectTab,
          planCode: _selectedPlan?.code,
          needRefresh: _noDataFound || _serverUnavailable,
          onRefresh: _refreshAndNotifyChildPageToRefresh,
          nextPlanOnPressed:
              _noDataFound || _serverUnavailable ? null : () => _switchPlan(1),
          prePlanOnPressed:
              _noDataFound || _serverUnavailable ? null : () => _switchPlan(-1),
          callback: (oldPageIndex, newPageIndex) {
            _handleRefresh(newPageIndex);
            setState(() {
              _selectTab = newPageIndex;
            });
          },
        ),
      );
    }));
  }

  /// ////////////////////////////////////////////////////////////////////////// Build UI
  Widget _buildPlansPage() {
    return PlansPage(
      refreshNotifier: _plansPageRefreshNotifier,
      onRefresh: _onPlansPageNotifyRefresh,
    );
  }

  Widget _buildMePage() {
    return MePage(
      refreshNotifier: _mePageRefreshNotifier,
      onRefresh: _onMePageNotifyRefresh,
    );
  }

  Widget _buildMainPage() {
    return PlanPage(
      refreshNotifier: _planPageRefreshNotifier,
      onRefresh: _onPlanPageNotifyRefresh,
      canBack: false,
    );
  }

  /// ////////////////////////////////////////////////////////////////////////// Handle interaction
  bool plansNeedRefresh = false;
  bool planNeedRefresh = false;
  bool meNeedRefresh = false;

  _handleRefresh(newPage) {
    if (newPage == MyHomePage.plansPageIndex && plansNeedRefresh) {
      _notifyChildPageRefresh(_plansPageRefreshNotifier);
      plansNeedRefresh = false;
    }
    if (newPage == MyHomePage.mainPageIndex && planNeedRefresh) {
      _notifyChildPageRefresh(_planPageRefreshNotifier);
      planNeedRefresh = false;
    }
    if (newPage == MyHomePage.mePageIndex && meNeedRefresh) {
      _notifyChildPageRefresh(_mePageRefreshNotifier);
      meNeedRefresh = false;
    }
  }

  _onPlansPageNotifyRefresh() {
    planNeedRefresh = true;
    meNeedRefresh = true;
    _doLoadData();
  }

  _onMePageNotifyRefresh() {
    planNeedRefresh = true;
    plansNeedRefresh = true;
    _doLoadData();
  }

  _onPlanPageNotifyRefresh() {
    meNeedRefresh = true;
    plansNeedRefresh = true;
    _doLoadData();
  }

  _refreshAndNotifyChildPageToRefresh() {
    meNeedRefresh = true;
    plansNeedRefresh = true;
    planNeedRefresh = true;
    _doLoadData();
  }

  /// ////////////////////////////////////////////////////////////////////////// Status update

  _notifyChildPageRefresh(ValueNotifier notifier) {
    final v = notifier.value;
    if (v != null && v < 0) {
      notifier.value = v - 1; // 设为 null 无效果
    } else {
      notifier.value = -1;
    }
  }

  _switchPlan(int inc) {
    startProgress(
      context,
      MessageManager(context).inLoading,
      () => PlanService().queryActivePlanIndex(),
      onSuccess: (value) async {
        if (value.length == 1) {
          showToast(context, MessageManager(context).youHaveOnlyOnePlan);
          return;
        }

        final index = value.indexOf(_selectedPlan.id);
        var newIndex = index + inc;
        if (newIndex == -1) {
          newIndex = value.length - 1;
        }

        if (newIndex == value.length) {
          newIndex = 0;
        }

        final v =
            await SelectedPlanManager().updateSelectedPlanID(value[newIndex]);
        if (newIndex == 0) {
          showToast(context, MessageManager(context).thisIsTheFirstPlan);
        }
        if (newIndex == value.length - 1) {
          showToast(context, MessageManager(context).thisIsTheLastPlan);
        }

        _planPageRefreshNotifier.value = v.id;
        setState(() {
          _selectedPlan = v;
        });
      },
      onDelayed: () {
        setState(() {
          _inLoading = true;
        });
      },
      onDelayedDismiss: () {
        setState(() {
          _inLoading = false;
        });
      },
      onError: _handleError,
    );
  }
}
