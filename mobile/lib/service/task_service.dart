import 'package:makeaplan/api/google/protobuf/wrappers.pb.dart' as pb;
import 'package:makeaplan/api/task.pb.dart' as pb;
import 'package:makeaplan/api/task_service.pb.dart' as pb;
import 'package:makeaplan/api/task_service.pbgrpc.dart' as grpc;

import 'grpc_client.dart';

class TaskService {
  static TaskService _singleton;

  TaskService._internal();

  factory TaskService() {
    if (_singleton == null) {
      _singleton = TaskService._internal();
    }
    return _singleton;
  }

  grpc.TaskQueryClient _client() {
    return grpc.TaskQueryClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  grpc.TaskModifyClient _modifyClient() {
    return grpc.TaskModifyClient(
      GRPCClient().client(),
      options: getCommonCallOptions(),
    );
  }

  Future<List<pb.Task>> queryPlanTask(int planID, int phaseID) async {
    print("TaskService.queryPlanTask");
    final req = pb.QueryPlanTaskRequest.create();
    req.planId = planID;

    if (phaseID != null) {
      final phid = pb.Int32Value.create();
      phid.value = phaseID;
      req.phaseId = phid;
    }

    final res = await _client().queryPlanTask(req);
    return res.tasks;
  }

  Future<void> deleteTask(int taskId) async {
    print("TaskService.deleteTask");
    final req = pb.DeleteTaskRequest.create();
    req.taskId = taskId;
    await _modifyClient().deleteTask(req);
  }

  Future<pb.Task> queryTask(int taskId) async {
    print("TaskService.queryTask");
    final req = pb.QueryTaskRequest.create();
    req.taskId = taskId;
    final res = await _client().queryTask(req);
    return res.task;
  }

  Future<int> createTask(pb.CreateTaskRequest req) async {
    print("TaskService.createTask");
    final res = await _modifyClient().createTask(req);
    return res.taskId;
  }

  Future<void> updateTask(pb.UpdateTaskRequest req) async {
    print("TaskService.updateTask");
    await _modifyClient().updateTask(req);
  }

  Future<void> updateTaskCheckState(int taskId, bool checked) async {
    print("TaskService.updateTaskCheckState");
    final req = pb.UpdateTaskCheckStateRequest.create();
    req.taskId = taskId;
    req.checked = checked;
    await _modifyClient().updateTaskCheckState(req);
    return;
  }
}
