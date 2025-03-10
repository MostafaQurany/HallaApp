import 'dart:async';

import 'package:flutter/material.dart';

class JobSearchBar extends StatefulWidget {
  final Function(String jobTag, double distance) onSearch;

  const JobSearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  _JobSearchBarState createState() => _JobSearchBarState();
}

class _JobSearchBarState extends State<JobSearchBar> {
  final TextEditingController _jobTagController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _jobTagController.dispose();
    _distanceController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onJobTagChanged(String jobTag) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      double distance = double.tryParse(_distanceController.text) ?? 10.0;
      widget.onSearch(jobTag, distance);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Tag Search Bar
        TextField(
          controller: _jobTagController,
          onChanged: _onJobTagChanged,
          decoration: InputDecoration(
            labelText: "Search Job Tag",
            hintText: "e.g., Flutter Developer",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 10),

        // Distance Input
        TextField(
          controller: _distanceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Search Distance (km)",
            hintText: "e.g., 20",
            prefixIcon: const Icon(Icons.location_on),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 20),

        // Search Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              double distance =
                  double.tryParse(_distanceController.text) ?? 10.0;
              widget.onSearch(_jobTagController.text, distance);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Search", style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
