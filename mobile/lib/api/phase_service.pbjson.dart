///
//  Generated code. Do not modify.
//  source: phase_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const QueryPhaseSummaryRequest$json = const {
  '1': 'QueryPhaseSummaryRequest',
  '2': const [
    const {'1': 'phase_id', '3': 1, '4': 1, '5': 5, '10': 'phaseId'},
    const {'1': 'plan_id', '3': 2, '4': 1, '5': 5, '10': 'planId'},
  ],
};

const QueryPhaseSummaryResponse$json = const {
  '1': 'QueryPhaseSummaryResponse',
  '2': const [
    const {'1': 'phase', '3': 1, '4': 1, '5': 11, '6': '.service.PhaseSummary', '10': 'phase'},
  ],
};

const QueryPlanPhaseSummaryRequest$json = const {
  '1': 'QueryPlanPhaseSummaryRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
  ],
};

const QueryPlanPhaseSummaryResponse$json = const {
  '1': 'QueryPlanPhaseSummaryResponse',
  '2': const [
    const {'1': 'phases', '3': 1, '4': 3, '5': 11, '6': '.service.PhaseSummary', '10': 'phases'},
  ],
};

const UpdatePhaseRequest$json = const {
  '1': 'UpdatePhaseRequest',
  '2': const [
    const {'1': 'phase_id', '3': 1, '4': 1, '5': 5, '10': 'phaseId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'note', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'note'},
    const {'1': 'start_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const UpdatePhaseResponse$json = const {
  '1': 'UpdatePhaseResponse',
};

const DeletePhaseRequest$json = const {
  '1': 'DeletePhaseRequest',
  '2': const [
    const {'1': 'phase_id', '3': 1, '4': 1, '5': 5, '10': 'phaseId'},
  ],
};

const DeletePhaseResponse$json = const {
  '1': 'DeletePhaseResponse',
};

const CreatePhaseRequest$json = const {
  '1': 'CreatePhaseRequest',
  '2': const [
    const {'1': 'plan_id', '3': 1, '4': 1, '5': 5, '10': 'planId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'note', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'note'},
    const {'1': 'start_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const CreatePhaseResponse$json = const {
  '1': 'CreatePhaseResponse',
  '2': const [
    const {'1': 'phase_id', '3': 1, '4': 1, '5': 5, '10': 'phaseId'},
  ],
};

