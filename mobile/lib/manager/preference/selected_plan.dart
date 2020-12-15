import 'package:makeaplan/global.dart';
import 'package:makeaplan/model/planid_code.dart';
import 'package:makeaplan/service/plan_service.dart';

class SelectedPlanManager {
  PlanIDCode _selectedPlan;

  static SelectedPlanManager _singleton;

  SelectedPlanManager._internal();

  factory SelectedPlanManager() {
    if (_singleton == null) {
      _singleton = SelectedPlanManager._internal();
    }
    return _singleton;
  }

  Future<PlanIDCode> selectedPlan() async {
    if (_selectedPlan == null) {
      return initSelectedPlan();
    }

    return _selectedPlan;
  }

  static final selectedPlanID = "selected_plan_id";

  Future<PlanIDCode> initSelectedPlan() async {
    var id = Global.prefs.get(selectedPlanID);
    if (id != null) {
      final p = await PlanService().queryPlanSummary(id);
      _selectedPlan = PlanIDCode(
        id: id,
        code: p.plan.code,
      );

      return _selectedPlan;
    }

    final ids = await PlanService().queryActivePlanIndex();
    id = ids[0];
    Global.prefs.setInt(selectedPlanID, id);

    final p = await PlanService().queryPlanSummary(id);
    _selectedPlan = PlanIDCode(id: id, code: p.plan.code);

    return _selectedPlan;
  }

  Future<PlanIDCode> updateSelectedPlanID(int planID) async {
    Global.prefs.setInt(selectedPlanID, planID);

    final p = await PlanService().queryPlanSummary(planID);
    _selectedPlan = PlanIDCode(id: p.plan.id, code: p.plan.code);

    return _selectedPlan;
  }

  Future reset() async {
    await Global.prefs.remove(selectedPlanID);
    _selectedPlan = null;
  }

  updateSelectedPlanIDDirectly(PlanIDCode ic) {
    _selectedPlan = ic;
  }
}
