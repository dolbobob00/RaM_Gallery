import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_assistant/core/data/models/character.dart';
import 'package:voice_assistant/core/domain/local_database/local_database.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_assistant/core/data/repository/network_repository.dart';

part 'rick_and_morty_state.dart';

class RickAndMortyCubit extends Cubit<RickAndMortyState> {
  RickAndMortyCubit() : super(RickAndMortyInitial());

  final _localDatabase = GetIt.I<ILocalDatabase>();
  final _networkRepository =
      GetIt.I<INetworkRepository<Map<String, dynamic>>>();

  List<Character> _characters = [];
  List<Character> get characters => _characters;
  int _currentPage = 1;
  bool _hasMorePages = true;
  bool _isLoading = false;

  Future<void> fetchCharacters({bool loadMore = false}) async {
    if (_isLoading || (!_hasMorePages && loadMore)) return;
    _isLoading = true;

    try {
      if (!loadMore) {
        emit(RickAndMortyLoading());
        _currentPage = 1;
        _characters = [];

        final cachedFirstPage =
            _localDatabase.readData<List<dynamic>>('first_page');
        if (cachedFirstPage != null) {
          try {
            _characters = cachedFirstPage
                .map((json) =>
                    Character.fromJson(Map<String, dynamic>.from(json)))
                .toList();
            _loadFavorites();
            emit(RickAndMortyLoaded(List.from(_characters)));
          } catch (e) {
            print('Error loading cached data: $e');
          }
        }
      }
      try {
        final response = await _networkRepository.getData(
          url: 'https://rickandmortyapi.com/api/character',
          additionalData: {'page': _currentPage},
        );
        final results = response['results'] as List<dynamic>;
        final info = response['info'] as Map<String, dynamic>;
        _hasMorePages = info['next'] != null;

        final newCharacters = results
            .map((json) => Character.fromJson(json as Map<String, dynamic>))
            .toList();
        if (loadMore) {
          _characters.addAll(newCharacters);
        } else {
          final favoriteIds =
              _characters.where((c) => c.isFavorite).map((c) => c.id).toList();
          _characters = newCharacters;
          for (var character in _characters) {
            character.isFavorite = favoriteIds.contains(character.id);
          }

          await _localDatabase.writeData(
              'first_page', _characters.map((c) => c.toJson()).toList());
        }

        emit(RickAndMortyLoaded(List.from(_characters)));
        _currentPage++;
      } catch (e) {
        print('Network error: $e');
        if (_characters.isNotEmpty) {
          emit(RickAndMortyLoaded(_characters));
        } else {
          emit(RickAndMortyError('No internet connection'));
        }
      }
    } finally {
      _isLoading = false;
    }
  }

  void toggleFavorite(Character character) {
    character.isFavorite = !character.isFavorite;
    final favoriteIds =
        _characters.where((c) => c.isFavorite).map((c) => c.id).toList();

    _localDatabase.writeData('favorites', favoriteIds);
    _localDatabase.writeData(
        'first_page', _characters.take(20).map((c) => c.toJson()).toList());

    emit(RickAndMortyLoaded(List.from(_characters)));
  }

  void _loadFavorites() {
    final favoriteIds = _localDatabase.readData<List<int>>('favorites') ?? [];
    for (var character in _characters) {
      character.isFavorite = favoriteIds.contains(character.id);
    }
  }

  void sortFavorites(String sortBy) {
    var sortedCharacters = List<Character>.from(_characters);

    var favorites = sortedCharacters.where((c) => c.isFavorite).toList();
    var nonFavorites = sortedCharacters.where((c) => !c.isFavorite).toList();

    switch (sortBy) {
      case 'name':
        favorites.sort((a, b) => a.name.compareTo(b.name));
      case 'status':
        favorites.sort((a, b) => a.status.compareTo(b.status));
      case 'species':
        favorites.sort((a, b) => a.species.compareTo(b.species));
    }

    _characters = [...favorites, ...nonFavorites];
    emit(RickAndMortyLoaded(_characters));
  }
}
