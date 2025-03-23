import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_assistant/presentation/providers/cubit/rick_and_morty_cubit.dart';
import 'package:voice_assistant/presentation/widgets/person_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String _sortBy = 'name'; // Default sort

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() => _sortBy = value);
              context.read<RickAndMortyCubit>().sortFavorites(_sortBy);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'name',
                child: Text('Sort by name'),
              ),
              const PopupMenuItem(
                value: 'status',
                child: Text('Sort by status'),
              ),
              const PopupMenuItem(
                value: 'species',
                child: Text('Sort by species'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<RickAndMortyCubit, RickAndMortyState>(
        builder: (context, state) {
          if (state is RickAndMortyLoaded) {
            final favorites = state.characters.where((c) => c.isFavorite).toList();
            if (favorites.isEmpty) {
              return const Center(
                child: Text('No favorite characters yet'),
              );
            }
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final character = favorites[index];
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: CharacterCard(
                    key: ValueKey(character.id),
                    imageUrl: character.image,
                    name: character.name,
                    status: character.status,
                    species: character.species,
                    location: character.location.name,
                    isFavorite: true,
                    onFavoritePressed: () => context
                        .read<RickAndMortyCubit>()
                        .toggleFavorite(character),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
