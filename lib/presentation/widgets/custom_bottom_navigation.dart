import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
      onTap: (value) => onSelectedItem(context, value),
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_rounded),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Catálogo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
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
