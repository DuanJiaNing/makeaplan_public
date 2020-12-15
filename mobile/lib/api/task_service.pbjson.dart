///
//  Generated code. Do not modify.
//  source: task_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const QueryTaskRequest$json = const {
  '1': 'QueryTaskRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
  ],
};

const QueryTaskResponse$json = const {
  '1': 'QueryTaskResponse',
  '2': const [
    const {'1': 'task', '3': 1, '4': 1, '5': 11, '6': '.service.Task', '10': 'task'},
  ],
};

const QueryPlanTaskRequest$json = const {
  '1': 'QueryPlanTaskRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'phase_id', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'phaseId'},
  ],
};

const QueryPlanTaskResponse$json = const {
  '1': 'QueryPlanTaskResponse',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.service.Task', '10': 'tasks'},
  ],
};

const UpdateTaskCheckStateResponse$json = const {
  '1': 'UpdateTaskCheckStateResponse',
};

const UpdateTaskCheckStateRequest$json = const {
  '1': 'UpdateTaskCheckStateRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
    const {'1': 'checked', '3': 2, '4': 1, '5': 8, '10': 'checked'},
  ],
};

const DeleteTaskRequest$json = const {
  '1': 'DeleteTaskRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
  ],
};

const CreateTaskResponse$json = const {
  '1': 'CreateTaskResponse',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
  ],
};

const DeleteTaskResponse$json = const {
  '1': 'DeleteTaskResponse',
};

const CreateTaskRequest$json = const {
  '1': 'CreateTaskRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'start_time', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'plan_id', '3': 4, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'phase_id', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'phaseId'},
  ],
};

const UpdateTaskRequest$json = const {
  '1': 'UpdateTaskRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'start_time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const UpdateTaskResponse$json = const {
  '1': 'UpdateTaskResponse',
};

