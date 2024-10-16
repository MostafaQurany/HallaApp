import 'package:flutter/material.dart';
import 'package:halla/features/contacts/presentation/screens/widget/search_field.dart';

class SearchFirstTimeContactScreen extends StatefulWidget {
  const SearchFirstTimeContactScreen({super.key});

  @override
  State<SearchFirstTimeContactScreen> createState() =>
      _SearchFirstTimeContactScreenState();
}

class _SearchFirstTimeContactScreenState
    extends State<SearchFirstTimeContactScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchField(searchController: searchController);
  }
}
