import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';

abstract interface class AdminRepository {
  //##-------------------CREATE DECK-------------------------##
  FutureEither<String> createDeck({required DeckCardModel deckCardModel});
  //##-------------------GET DECK-------------------------##
  FutureEither<AdminDeckModel> getAdminDeck();
}

class AdminRepositoryImp implements AdminRepository {
  final ApiService _apiService;

  AdminRepositoryImp({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------CREATE DECK-------------------------##

  @override
  FutureEither<String> createDeck({
    required DeckCardModel deckCardModel,
  }) async {
    final response = await _apiService.post<Map>(
      'admin/decks',
      data: {...deckCardModel.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) {
      return Right("Deck Create Successful !!!");
    });
  }

  //##-------------------GET DECK-------------------------##
  @override
  FutureEither<AdminDeckModel> getAdminDeck() async {
    final respone = await _apiService.get('admin/decks');

    return respone.fold((failure) => Left(failure), (data) {
      final deckList = data['data'];
      final decks = AdminDeckModel.fromMap(deckList);
      return Right(decks);
    });
  }
}
