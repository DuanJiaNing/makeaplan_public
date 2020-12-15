import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/statistics.pb.dart' as pb;
import 'package:makeaplan/utils/utils.dart';

bool statisEmpty(pb.Statistics statis) {
  return statis == null || statis.total == null || statis.total == 0;
}

bool indexStatisEmpty(pb.PlanSummary planSummary) {
  return planSummary.plan.totalIndex == null ||
      planSummary.plan.totalIndex == 0;
}

bool daysStatisEmpty(pb.PlanSummary planSummary) {
  final daysStatis = Utils.daysStatis(
    Utils.pb2DateTime(planSummary.plan.startTime),
    Utils.pb2DateTime(planSummary.plan.endTime),
  );
  return daysStatis == null ||
      daysStatis.total == null ||
      daysStatis.total == 0;
}

bool emptyIndex(pb.PlanSummary ps) {
  return statisEmpty(ps.phaseStatis) &&
      statisEmpty(ps.taskStatis) &&
      daysStatisEmpty(ps) &&
      indexStatisEmpty(ps);
}
