///
//  Generated code. Do not modify.
//  source: plan.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const PlanType$json = const {
  '1': 'PlanType',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'TASK_LIST', '2': 1},
    const {'1': 'PHASED', '2': 2},
  ],
};

const PlanCompleteStatus$json = const {
  '1': 'PlanCompleteStatus',
  '2': const [
    const {'1': 'UNKNOWN_PLAN_COMPLETE_STATUS', '2': 0},
    const {'1': 'PLAN_DONE', '2': 1},
    const {'1': 'PLAN_SUCCEED', '2': 2},
    const {'1': 'PLAN_FAILED', '2': 3},
  ],
};

const Plan$json = const {
  '1': 'Plan',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'note', '3': 4, '4': 1, '5': 9, '10': 'note'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.service.PlanType', '10': 'type'},
    const {'1': 'total_index', '3': 7, '4': 1, '5': 5, '10': 'totalIndex'},
    const {'1': 'min_index', '3': 8, '4': 1, '5': 5, '10': 'minIndex'},
    const {'1': 'completed_index', '3': 9, '4': 1, '5': 5, '10': 'completedIndex'},
    const {'1': 'start_time', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'update_time', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updateTime'},
  ],
};

const PlanSummary$json = const {
  '1': 'PlanSummary',
  '2': const [
    const {'1': 'plan', '3': 1, '4': 1, '5': 11, '6': '.service.Plan', '10': 'plan'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.service.CommonStatus', '10': 'status'},
    const {'1': 'taskStatis', '3': 3, '4': 1, '5': 11, '6': '.service.Statistics', '10': 'taskStatis'},
    const {'1': 'phaseStatis', '3': 4, '4': 1, '5': 11, '6': '.service.Statistics', '10': 'phaseStatis'},
  ],
};

