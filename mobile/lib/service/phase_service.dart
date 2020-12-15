import 'package:makeaplan/api/phase.pb.dart' as pb;
import 'package:makeaplan/api/phase_service.pb.dart' as pb;
import 'package:makeaplan/api/phase_service.pbgrpc.dart' as grpc;

import 'grpc_client.dart';

class PhaseService {
  static PhaseService _singleton;

  PhaseService._internal();

  factory PhaseService() {
    if (_singleton == null) {
      _singleton = PhaseService._internal();
    }
    return _singleton;
  }

  grpc.PhaseQueryClient _client() {
    return grpc.PhaseQueryClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  grpc.PhaseModifyClient _modifyClient() {
    return grpc.PhaseModifyClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  Future<List<pb.PhaseSummary>> queryPlanPhaseSummary(int planID) async {
    print("PhaseService.queryPlanPhaseSummary");
    final req = pb.QueryPlanPhaseSummaryRequest.create();
    req.planId = planID;
    final res = await _client().queryPlanPhaseSummary(req);
    return res.phases;
  }

  Future<pb.PhaseSummary> queryPhaseSummary(int planID, int phaseID) async {
    print("PhaseService.queryPhaseSummary");
    final req = pb.QueryPhaseSummaryRequest.create();
    req.planId = planID;
    req.phaseId = phaseID;
    final res = await _client().queryPhaseSummary(req);
    return res.phase;
  }

  Future<void> deletePhase(int phaseId) async {
    print("PhaseService.deletePhase");
    final req = pb.DeletePhaseRequest.create();
    req.phaseId = phaseId;
    await _modifyClient().deletePhase(req);
  }

  Future<int> createPhase(pb.CreatePhaseRequest req) async {
    print("PhaseService.createPhase");
    final res = await _modifyClient().createPhase(req);
    return res.phaseId;
  }

  Future<void> updatePhase(pb.UpdatePhaseRequest req) async {
    print("PhaseService.updatePhase");
    await _modifyClient().updatePhase(req);
  }
}
