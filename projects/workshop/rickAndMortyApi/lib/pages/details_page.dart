import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static const String routeId = '/details';

  const DetailsPage({super.key, required this.characterId});

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}