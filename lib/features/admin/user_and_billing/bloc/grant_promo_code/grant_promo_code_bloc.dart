import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grant_promo_code_event.dart';
part 'grant_promo_code_state.dart';
part '../bloc/grant_promo_code_bloc.freezed.dart';

class GrantPromoCodeBloc extends Bloc<GrantPromoCodeEvent, GrantPromoCodeState> {
  GrantPromoCodeBloc() : super(_Initial()) {
    on<GrantPromoCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
