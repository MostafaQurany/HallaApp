import 'package:flutter/material.dart';
import 'package:halla/features/contacts/presentation/screens/widget/search_field.dart';

class SearchScreen extends StatefulWidget {
  final TextEditingController searchController;

  const SearchScreen({super.key, required this.searchController});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew'
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    widget.searchController.addListener(_updateSearchResults);
  }

  void _updateSearchResults() {
    setState(() {
      _filteredItems = _allItems
          .where((item) => item
              .toLowerCase()
              .contains(widget.searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchField(
              searchController: widget.searchController,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
