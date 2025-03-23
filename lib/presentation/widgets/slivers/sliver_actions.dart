import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_assistant/core/domain/theme_provider/cubit/theme_provider_cubit.dart';

import '../custom_icon_button.dart';

class SliverActions extends StatelessWidget {
  const SliverActions({super.key});

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 140,
      toolbarHeight: 140,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quick actions',
                style: themeof.textTheme.bodyMedium!.copyWith(
                  color: themeof.colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                    onPressed: () =>
                        context.read<ThemeProviderCubit>().changeThemeToNext(),
                    icon: Icon(
                      Icons.change_history,
                    ),
                    belowButton: Text(
                      'Theme',
                      style: themeof.textTheme.bodyMedium!.copyWith(
                        color: themeof.colorScheme.inversePrimary,
                      ),
                    ),
                    sizeOfButton: const Size(50, 50),
                  ),
                  CustomIconButton(
                    onPressed: () {
                      context.push(
                        '/favorites',
                      );
                    },
                    icon: Icon(
                      Icons.voice_chat,
                    ),
                    belowButton: Text(
                      'Favorites',
                      style: themeof.textTheme.bodyMedium!.copyWith(
                        color: themeof.colorScheme.inversePrimary,
                      ),
                    ),
                    sizeOfButton: const Size(50, 50),
                  ),
                  CustomIconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Available features',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Auto load at end of scroll',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '2. Favorites with full logic, also have animation',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '3. Saving to Hive a lot of info',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '4. Support black theme',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '5. Have BottomNavigationBar',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                    ),
                    belowButton: Text(
                      'Info',
                      style: themeof.textTheme.bodyMedium!.copyWith(
                        color: themeof.colorScheme.inversePrimary,
                      ),
                    ),
                    sizeOfButton: const Size(50, 50),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
