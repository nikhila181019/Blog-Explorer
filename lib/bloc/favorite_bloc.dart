import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class FavoriteEvent extends Equatable {
  final dynamic blog;

  FavoriteEvent(this.blog);

  @override
  List<Object> get props => [blog];
}

class FavoriteState extends Equatable {
  final List<dynamic> favorites;

  FavoriteState(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState([])) {
    on<FavoriteEvent>((event, emit) {
      final updatedFavorites = List.from(state.favorites);
      if (updatedFavorites.contains(event.blog)) {
        updatedFavorites.remove(event.blog);
      } else {
        updatedFavorites.add(event.blog);
      }
      emit(FavoriteState(updatedFavorites));
    });
  }
}
