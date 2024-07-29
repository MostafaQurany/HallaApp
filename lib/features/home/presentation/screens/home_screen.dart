import 'package:flutter/material.dart';
import 'package:halla/features/contacts/presentation/screens/contacts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContactsScreen(),
    );
  }
}
