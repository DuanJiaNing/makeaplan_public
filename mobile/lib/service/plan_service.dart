import 'package:grpc/grpc.dart' as grpc;
import 'package:makeaplan/api/plan.pb.dart' as pb;
import 'package:makeaplan/api/plan_service.pb.dart' as pb;
import 'package:makeaplan/api/plan_service.pbgrpc.dart' as grpc;
import 'package:makeaplan/model/planid_code.dart';

import 'grpc_client.dart';

class PlanService {
  static PlanService _singleton;

  PlanService._internal();

  factory PlanService() {
    if (_singleton == null) {
      _singleton = PlanService._internal();
    }
    return _singleton;
  }

  grpc.PlanQueryClient _client() {
    return grpc.PlanQueryClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  grpc.PlanModifyClient _modifyClient() {
    return grpc.PlanModifyClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  Future<List<pb.PlanSummary>> queryActivePlanSummary() async {
    print("PlanService.queryActivePlanSummary");
    final req = pb.QueryActivePlanSummaryRequest.create();
    final res = await _client().queryActivePlanSummary(req);
    if (res == null || res.plans == null || res.plans.length == 0) {
      throw grpc.GrpcError.notFound();
    }
    return res.plans;
  }

  Future<List<pb.Plan>>  queryArchivedPlan() async {
    print("PlanService.queryArchivedPlan");
    final req = pb.QueryArchivedPlanRequest.create();
    final res = await _client().queryArchivedPlan(req);
    if (res == null || res.plans == null || res.plans.length == 0) {
      throw grpc.GrpcError.notFound();
    }
    return res.plans;
  }

  Future<List<int>> queryActivePlanIndex() async {
    print("PlanService.queryActivePlanIndex");
    final req = pb.QueryActivePlanIndexRequest.create();
    final res = await _client().queryActivePlanIndex(req);
    if (res == null || res.ids == null || res.ids.length == 0) {
      throw grpc.GrpcError.notFound();
    }
    return res.ids;
  }

  Future<pb.PlanSummary> queryPlanSummary(int planID) async {
    print("PlanService.queryPlanSummary");
    final req = pb.QueryPlanSummaryRequest.create();
    req.id = planID;
    final res = await _client().queryPlanSummary(req);
    if (res == null || res.planSummary == null) {
      throw grpc.GrpcError.notFound();
    }
    return res.planSummary;
  }

  Future<PlanIDCode> createPlan(pb.CreatePlanRequest req) async {
    print("PlanService.createPlan");
    final res = await _modifyClient().createPlan(req);
    return PlanIDCode(id: res.id, code: res.code);
  }

  Future<pb.QueryPlanCountResponse> queryPlanCount() async {
    print("PlanService.queryPlanCount");
    return await _client().queryPlanCount(pb.QueryPlanCountRequest.create());
  }

  Future<void> updatePlan(pb.UpdatePlanRequest req) async {
    print("PlanService.updatePlan");
    await _modifyClient().updatePlan(req);
    return;
  }

  Future<void> updatePlanCompletedIndex(int num, planId) async {
    print("PlanService.updatePlanCompletedIndex");
    await _modifyClient()
        .updatePlanCompletedIndex(pb.UpdatePlanCompletedIndexRequest.create()
          ..value = num
          ..planId = planId);
    return;
  }

  Future<String> updatePlanArchiveState(
      pb.UpdatePlanArchiveStateRequest req) async {
    print("PlanService.updatePlanArchiveState");
    final res = await _modifyClient().updatePlanArchiveState(req);
    return res.planNewCode?.value;
  }

  Future<void> deletePlan(int planID) async {
    print("PlanService.deletePlan");
    final req = pb.DeletePlanRequest.create();
    req.id = planID;
    await _modifyClient().deletePlan(req);
  }
}
