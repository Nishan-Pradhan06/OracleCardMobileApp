part of 'guidance_metrics_bloc.dart';

@freezed
abstract class GuidanceMetricsEvent with _$GuidanceMetricsEvent {
  const factory GuidanceMetricsEvent.getGuidanceMetrics({ required int guidanceId}) = _GuidanceMetricsE;
}