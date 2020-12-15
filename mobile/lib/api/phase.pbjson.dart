///
//  Generated code. Do not modify.
//  source: phase.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const PhaseCompleteStatus$json = const {
  '1': 'PhaseCompleteStatus',
  '2': const [
    const {'1': 'UNKNOWN_PHASE_COMPLETE_STATUS', '2': 0},
    const {'1': 'PHASE_DONE', '2': 1},
  ],
};

const Phase$json = const {
  '1': 'Phase',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'note', '3': 3, '4': 1, '5': 9, '10': 'note'},
    const {'1': 'start_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

const PhaseSummary$json = const {
  '1': 'PhaseSummary',
  '2': const [
    const {'1': 'phase', '3': 1, '4': 1, '5': 11, '6': '.service.Phase', '10': 'phase'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.service.CommonStatus', '10': 'status'},
    const {'1': 'taskStatis', '3': 3, '4': 1, '5': 11, '6': '.service.Statistics', '10': 'taskStatis'},
  ],
};

