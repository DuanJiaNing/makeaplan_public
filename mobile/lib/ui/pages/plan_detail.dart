import 'package:flutter/material.dart';
import 'package:makeaplan/ui/pages/main/plan.dart';

class PlanDetailPage extends StatefulWidget {
  final int selectedPlanID;
  final VoidCallback onRefresh;
  final VoidCallback onDeleted;

  const PlanDetailPage({Key key, this.selectedPlanID, this.onRefresh, this.onDeleted}) : super(key: key);

  @override
  _PlanDetailPageState createState() => _PlanDetailPageState();
}

class _PlanDetailPageState extends State<PlanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlanPage(
        forceShowIndexPanel: true,
        onRefresh: widget.onRefresh,
        onDeleted: widget.onDeleted,
        selectedPlanID: widget.selectedPlanID,
      ),
    );
  }
}
