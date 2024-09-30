import 'package:flutter/material.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/favorite_container_decoration.dart';

class DragerCategories extends StatelessWidget {
  final String name;
  const DragerCategories({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return FavoriteContainerDecoration(
        widget: Row(
      children: [
        Text(name),
        const Icon(Icons.menu),
      ],
    ));
  }
}
