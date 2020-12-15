import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;

class PlanSummaryWithTodoListTask {
  pb.PlanSummary planSummary;
  List<pb.Task> tasks;
}
