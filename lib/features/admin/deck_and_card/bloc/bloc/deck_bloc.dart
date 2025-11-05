import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';
import 'package:oracle_card_app/features/admin/repository/admin_repository.dart';

part 'deck_event.dart';
part 'deck_state.dart';
part 'deck_bloc.freezed.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  final AdminRepository _adminRepository;

  DeckBloc({required AdminRepository repo})
    : _adminRepository = repo,
      super(DeckState.initial()) {
    on<_DeckE>(_createDeckCard);
  }

  Future<void> _createDeckCard(_DeckE event, Emitter<DeckState> emit) async {
    emit(DeckState.loading());
    final result = await _adminRepository.createDeck(
      deckCardModel: event.deckCardModel,
    );

    result.fold(
      (failure) => emit(DeckState.failure(failure)),
      (data) => emit(DeckState.loaded(data)),
    );
  }
}
