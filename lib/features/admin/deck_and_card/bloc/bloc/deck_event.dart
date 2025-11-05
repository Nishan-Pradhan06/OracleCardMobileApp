part of 'deck_bloc.dart';

@freezed
abstract class DeckEvent with _$DeckEvent {
  const factory DeckEvent.createDeckCard(DeckCardModel deckCardModel) = _DeckE;
}
