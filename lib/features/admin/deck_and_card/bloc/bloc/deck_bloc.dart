
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';

part 'deck_event.dart';
part 'deck_state.dart';
part 'deck_bloc.freezed.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc() : super(DeckState.initial()) {
    on<DeckEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
