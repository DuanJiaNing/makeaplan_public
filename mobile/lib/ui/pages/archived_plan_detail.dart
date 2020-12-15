import 'package:flutter/material.dart';
import 'package:makeaplan/ui/pages/main/plan.dart';

class ArchivedPlanDetailPage extends StatefulWidget {
  final int planID;
  final VoidCallback onRefresh;

  const ArchivedPlanDetailPage({Key key, this.planID, this.onRefresh})
      : super(key: key);

  @override
  _PlanDetailPageState createState() => _PlanDetailPageState();
}

class _PlanDetailPageState extends State<ArchivedPlanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlanPage(
        onRefresh: widget.onRefresh,
        archived: true,
        forceShowIndexPanel: true,
        selectedPlanID: widget.planID,
      ),
    );
  }
}
