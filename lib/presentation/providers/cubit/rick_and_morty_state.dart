part of 'rick_and_morty_cubit.dart';

@immutable
sealed class RickAndMortyState {}

final class RickAndMortyInitial extends RickAndMortyState {}

final class RickAndMortyLoading extends RickAndMortyState {}

final class RickAndMortyLoaded extends RickAndMortyState {
  final List<Character> characters;
  RickAndMortyLoaded(this.characters);
}

final class RickAndMortyError extends RickAndMortyState {
  final String message;
  RickAndMortyError(this.message);
}
