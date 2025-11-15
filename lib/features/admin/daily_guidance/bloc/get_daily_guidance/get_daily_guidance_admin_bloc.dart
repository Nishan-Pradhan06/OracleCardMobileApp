import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

import '../../model/get_daily_guidance_admin_model.dart';

part 'get_daily_guidance_admin_event.dart';
part 'get_daily_guidance_admin_state.dart';
part 'get_daily_guidance_admin_bloc.freezed.dart';

class GetDailyGuidanceAdminBloc
    extends Bloc<GetDailyGuidanceAdminEvent, GetDailyGuidanceAdminState> {
  final AdminRepository _adminRepository;
  GetDailyGuidanceAdminBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(GetDailyGuidanceAdminState.initial()) {
    on<_GetDailyGuidanceModelE>(_onGetDailyGuidanceAdminList);
  }

  Future<void> _onGetDailyGuidanceAdminList(
    _GetDailyGuidanceModelE event,
    Emitter<GetDailyGuidanceAdminState> emit,
  ) async {
    emit(GetDailyGuidanceAdminState.loading());

    final result = await _adminRepository.getDailyGuidance();

    result.fold(
      (failure) => emit(GetDailyGuidanceAdminState.failure(failure)),
      (data) => emit(GetDailyGuidanceAdminState.loaded(data)),
    );
  }
}
