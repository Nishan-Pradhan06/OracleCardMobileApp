import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

part 'get_journal_by_id_event.dart';
part 'get_journal_by_id_state.dart';
part 'get_journal_by_id_bloc.freezed.dart';

class GetJournalByIdBloc
    extends Bloc<GetJournalByIdEvent, GetJournalByIdState> {
  GetJournalByIdBloc() : super(GetJournalByIdState.initial()) {
    on<GetJournalByIdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
