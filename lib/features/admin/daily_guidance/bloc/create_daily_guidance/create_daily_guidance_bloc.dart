import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/model/admin_daily_guidance_model.dart';

import '../../../repository/admin_repository.dart';

part 'create_daily_guidance_event.dart';
part 'create_daily_guidance_state.dart';
part 'create_daily_guidance_bloc.freezed.dart';

class CreateDailyGuidanceBloc
    extends Bloc<CreateDailyGuidanceEvent, CreateDailyGuidanceState> {
  final AdminRepository _adminRepository;

  CreateDailyGuidanceBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(CreateDailyGuidanceState.initial()) {
    on<_CreateDailyGuidanceE>(_onCreateDailyGuidance);
  }

  Future<void> _onCreateDailyGuidance(
    _CreateDailyGuidanceE event,
    Emitter<CreateDailyGuidanceState> emit,
  ) async {
    emit(CreateDailyGuidanceState.loading());
    final result = await _adminRepository.createDailyGuidance(
      adminDailyGuidance: event.adminDailyGuidanceM,
    );

    result.fold(
      (failure) => emit(CreateDailyGuidanceState.failure(failure)),
      (data) => emit(CreateDailyGuidanceState.loaded(data)),
    );
  }
}
