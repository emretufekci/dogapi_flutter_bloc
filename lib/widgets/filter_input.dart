import 'package:flutter/material.dart';

import '../model/dog_model.dart';

class FilterInput extends StatefulWidget {
  final List<Dog> dogs;
  const FilterInput({super.key, required this.dogs});

  @override
  State<FilterInput> createState() => _FilterInputState();
}

class _FilterInputState extends State<FilterInput> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _showSearchModal(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 48,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFE5E5EA),
                  width: 2,
                ),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false, // Set to true to make it initially expanded
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Your search UI elements can be added here

                    // Example: Text field for search
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    // Example: Button to close the modal
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    // Request focus after the modal has been built
    Future.delayed(Duration.zero, () {
      _focusNode.requestFocus();
    });
  }
}
