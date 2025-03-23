import 'package:flutter/material.dart';
class SliverNameSettings extends StatelessWidget {
  const SliverNameSettings({super.key});
  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return SliverAppBar(
      floating: true,
      toolbarHeight: 80,
      backgroundColor: themeof.colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome!',
                    style: themeof.textTheme.bodyLarge!.copyWith(
                      color: themeof.colorScheme.secondary.withAlpha(200),
                    ),
                  ),
                  Text(
                    'Rick and Morty fan!',
                    style: themeof.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
