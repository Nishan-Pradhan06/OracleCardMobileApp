import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/home/repository/guidance_repository.dart';
import 'package:oracle_card_app/features/users/library/models/guidance_archive_model.dart';

part 'get_guidance_archive_event.dart';
part 'get_guidance_archive_state.dart';
part 'get_guidance_archive_bloc.freezed.dart';

class GetGuidanceArchiveBloc
    extends Bloc<GetGuidanceArchiveEvent, GetGuidanceArchiveState> {
  final GuidanceRepository _guidanceRepository;
  GetGuidanceArchiveBloc({required GuidanceRepository repo})
    : _guidanceRepository = repo,
      super(GetGuidanceArchiveState.initial()) {
    on<_GetGuidanceArchiveE>(_onGetGuidanceArchive);
  }

  Future<void> _onGetGuidanceArchive(
    _GetGuidanceArchiveE event,
    Emitter<GetGuidanceArchiveState> emit,
  ) async {
    emit(GetGuidanceArchiveState.loading());

    await Future.delayed(Duration(seconds: 3));

    final result = await _guidanceRepository.getGuidanceArchive();

    result.fold(
      (failure) => emit(GetGuidanceArchiveState.loading()),
      (data) => emit(GetGuidanceArchiveState.loaded(data)),
    );
  }
}
