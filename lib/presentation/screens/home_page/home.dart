import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_assistant/presentation/widgets/person_card.dart';
import 'package:voice_assistant/presentation/widgets/slivers/sliver_fill_remaining.dart';

import '../../providers/cubit/rick_and_morty_cubit.dart';
import '../../widgets/slivers/sliver_actions.dart';
import '../../widgets/slivers/sliver_name_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    const scrollThreshold = 500.0;

    if (maxScroll - currentScroll <= scrollThreshold) {
      final state = context.read<RickAndMortyCubit>().state;
      if (state is RickAndMortyLoaded) {
        context.read<RickAndMortyCubit>().fetchCharacters(loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverNameSettings(),
         
            const SliverActions(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recent ask\'s',
                  style: themeof.textTheme.titleLarge,
                ),
              ),
            ),
            BlocBuilder<RickAndMortyCubit, RickAndMortyState>(
              builder: (context, state) {
                if (state is RickAndMortyLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is RickAndMortyLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final character = state.characters[index];
                        return CharacterCard(
                          imageUrl: character.image,
                          name: character.name,
                          status: character.status,
                          species: character.species,
                          location: character.location.name,
                          isFavorite: character.isFavorite,
                          onFavoritePressed: () => context.read<RickAndMortyCubit>().toggleFavorite(character),
                        );
                      },
                      childCount: state.characters.length,
                    ),
                  );
                } else if (state is RickAndMortyError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                }
                return const SliverToBoxAdapter();
              },
            ),
            const MySliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}
