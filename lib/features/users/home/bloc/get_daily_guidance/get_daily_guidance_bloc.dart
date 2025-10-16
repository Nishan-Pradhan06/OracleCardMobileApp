import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/home/models/daily_guidance_model.dart';
import 'package:oracle_card_app/features/users/home/repository/guidance_repository.dart';

part 'get_daily_guidance_event.dart';
part 'get_daily_guidance_state.dart';
part 'get_daily_guidance_bloc.freezed.dart';

class GetDailyGuidanceBloc
    extends Bloc<GetDailyGuidanceEvent, GetDailyGuidanceState> {
  final GuidanceRepository _guidanceRepository;
  GetDailyGuidanceBloc({required GuidanceRepository repo})
    : _guidanceRepository = repo,
      super(GetDailyGuidanceState.initial()) {
    on<_GetDailyGuidanceE>(_onGetDailyGuidance);
  }

  Future<void> _onGetDailyGuidance(
    _GetDailyGuidanceE event,
    Emitter<GetDailyGuidanceState> emit,
  ) async {
    emit(GetDailyGuidanceState.loading());
    await Future.delayed(Duration(seconds: 10));
    final result = await _guidanceRepository.getDailyGuidance();

    result.fold(
      (failure) => emit(GetDailyGuidanceState.failure(failure)),
      (data) => emit(GetDailyGuidanceState.loaded(data)),
    );
  }
}
