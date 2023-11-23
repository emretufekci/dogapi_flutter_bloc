// widgets/filter_input.dart

import 'package:flutter/material.dart';

class FilterInput extends StatelessWidget {
  final Function(String) onFilterChanged;

  const FilterInput({super.key, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onFilterChanged,
      decoration: InputDecoration(
        labelText: 'Filter by Breed',
        hintText: 'Enter breed name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
