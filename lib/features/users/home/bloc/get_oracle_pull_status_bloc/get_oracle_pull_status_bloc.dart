import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/home/models/orcale_card_pull_status_model.dart';
import 'package:oracle_card_app/features/users/home/repository/oracle_card_repository.dart';

part 'get_oracle_pull_status_event.dart';
part 'get_oracle_pull_status_state.dart';
part 'get_oracle_pull_status_bloc.freezed.dart';

class GetOraclePullStatusBloc
    extends Bloc<GetOraclePullStatusEvent, GetOraclePullStatusState> {
  final OracleCardRepository _oracleCardRepository;
  GetOraclePullStatusBloc({required OracleCardRepository repo})
    : _oracleCardRepository = repo,
      super(GetOraclePullStatusState.initial()) {
    on<_GetOracleCardPullStatusE>(_onGetOracleCardPullStatus);
  }

  Future<void> _onGetOracleCardPullStatus(
    _GetOracleCardPullStatusE event,
    Emitter<GetOraclePullStatusState> emit,
  ) async {
    emit(GetOraclePullStatusState.loading());
    await Future.delayed(Duration(seconds: 3));

    final result = await _oracleCardRepository.getCardPullStatus();
    result.fold(
      (failure) => emit(GetOraclePullStatusState.failure(failure)),
      (data) => emit(GetOraclePullStatusState.loaded(data)),
    );
  }
}
