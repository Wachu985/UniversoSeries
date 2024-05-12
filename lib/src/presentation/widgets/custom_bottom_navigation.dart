import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    return BottomNavigationBar(
      elevation: 20,
      onTap: (value) => onSelectedItem(context, value),
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_max_rounded),
          label: textTraslate.label1,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.list_alt_rounded),
          label: textTraslate.label2,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_outline),
          label: textTraslate.label3,
        ),
      ],
    );
  }

  void onSelectedItem(BuildContext context, int value) {
    switch (value) {
      case 0:
        context.go('/home/$value');
        break;
      case 1:
        context.go('/home/$value');
        break;
      case 2:
        context.go('/home/$value');
        break;
    }
  }
}
