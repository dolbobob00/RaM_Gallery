import 'package:flutter/material.dart';

class MySliverFillRemaining extends StatelessWidget {
  const MySliverFillRemaining({super.key});

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.tips_and_updates,
            size: 48,
          ),
          Text(
            'Let\'s all love Rem!',
            style: themeof.textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Stay turned for exciting updates and improvement\'s',
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Learn more',
            ),
          ),
        ],
      ),
    );
  }
}
