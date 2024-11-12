import 'package:flutter/material.dart';
import 'package:halla/features/contacts/presentation/screens/widget/search_field.dart';

class SearchFirstTimeContactScreen extends StatefulWidget {
  final TextEditingController searchController;

  const SearchFirstTimeContactScreen(
      {super.key, required this.searchController});

  @override
  State<SearchFirstTimeContactScreen> createState() =>
      _SearchFirstTimeContactScreenState();
}

class _SearchFirstTimeContactScreenState
    extends State<SearchFirstTimeContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SearchField(searchController: widget.searchController);
  }
}
