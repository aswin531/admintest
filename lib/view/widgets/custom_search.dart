import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16),
                  contentPadding: const EdgeInsets.all(5),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Handle filter/sort button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
