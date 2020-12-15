///
//  Generated code. Do not modify.
//  source: plan_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const QueryPlanCountRequest$json = const {
  '1': 'QueryPlanCountRequest',
};

const QueryPlanCountResponse$json = const {
  '1': 'QueryPlanCountResponse',
  '2': const [
    const {'1': 'active_plan_count', '3': 1, '4': 1, '5': 5, '10': 'activePlanCount'},
    const {'1': 'archived_plan_count', '3': 2, '4': 1, '5': 5, '10': 'archivedPlanCount'},
  ],
};

const QueryArchivedPlanRequest$json = const {
  '1': 'QueryArchivedPlanRequest',
};

const QueryActivePlanIndexRequest$json = const {
  '1': 'QueryActivePlanIndexRequest',
};

const QueryActivePlanIndexResponse$json = const {
  '1': 'QueryActivePlanIndexResponse',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 5, '10': 'ids'},
  ],
};

const QueryPlanSummaryResponse$json = const {
  '1': 'QueryPlanSummaryResponse',
  '2': const [
    const {'1': 'plan_summary', '3': 1, '4': 1, '5': 11, '6': '.service.PlanSummary', '10': 'planSummary'},
  ],
};

const QueryPlanSummaryRequest$json = const {
  '1': 'QueryPlanSummaryRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

const QueryActivePlanSummaryRequest$json = const {
  '1': 'QueryActivePlanSummaryRequest',
};

const QueryArchivedPlanResponse$json = const {
  '1': 'QueryArchivedPlanResponse',
  '2': const [
    const {'1': 'plans', '3': 1, '4': 3, '5': 11, '6': '.service.Plan', '10': 'plans'},
  ],
};

const QueryActivePlanSummaryResponse$json = const {
  '1': 'QueryActivePlanSummaryResponse',
  '2': const [
    const {'1': 'plans', '3': 1, '4': 3, '5': 11, '6': '.service.PlanSummary', '10': 'plans'},
  ],
};

const UpdatePlanCompletedIndexRequest$json = const {
  '1': 'UpdatePlanCompletedIndexRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
};

const UpdatePlanCompletedIndexResponse$json = const {
  '1': 'UpdatePlanCompletedIndexResponse',
};

const UpdatePlanArchiveStateResponse$json = const {
  '1': 'UpdatePlanArchiveStateResponse',
  '2': const [
    const {'1': 'plan_new_code', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'planNewCode'},
  ],
};

const UpdatePlanArchiveStateRequest$json = const {
  '1': 'UpdatePlanArchiveStateRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'archived', '3': 2, '4': 1, '5': 8, '10': 'archived'},
  ],
};

const DeletePlanRequest$json = const {
  '1': 'DeletePlanRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

const DeletePlanResponse$json = const {
  '1': 'DeletePlanResponse',
};

const CreatePlanRequest$json = const {
  '1': 'CreatePlanRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'note', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'note'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.service.PlanType', '10': 'type'},
    const {'1': 'total_index', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'totalIndex'},
    const {'1': 'min_index', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'minIndex'},
    const {'1': 'start_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const UpdatePlanRequest$json = const {
  '1': 'UpdatePlanRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'note', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'note'},
    const {'1': 'total_index', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'totalIndex'},
    const {'1': 'min_index', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Int32Value', '10': 'minIndex'},
    const {'1': 'start_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const UpdatePlanResponse$json = const {
  '1': 'UpdatePlanResponse',
};

const CreatePlanResponse$json = const {
  '1': 'CreatePlanResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

