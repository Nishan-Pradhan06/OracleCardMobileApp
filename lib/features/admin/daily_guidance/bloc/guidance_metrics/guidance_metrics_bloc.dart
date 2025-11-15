import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/model/guidance_metrics_model.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'guidance_metrics_event.dart';
part 'guidance_metrics_state.dart';
part 'guidance_metrics_bloc.freezed.dart';

class GuidanceMetricsBloc
    extends Bloc<GuidanceMetricsEvent, GuidanceMetricsState> {
  final AdminRepository _adminRepository;
  GuidanceMetricsBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GuidanceMetricsState.initial()) {
    on<_GuidanceMetricsE>(_onGetGuidanceMetrics);
  }
  Future<void> _onGetGuidanceMetrics(
    _GuidanceMetricsE event,
    Emitter<GuidanceMetricsState> emit,
  ) async {
    emit(GuidanceMetricsState.loading());

    final result = await _adminRepository.getDailyGuidanceMetrics(
      dailyGuidanceId: event.guidanceId,
    );

    result.fold(
      (failure) => emit(GuidanceMetricsState.failure(failure)),
      (data) => emit(GuidanceMetricsState.loaded(data)),
    );
  }
}
