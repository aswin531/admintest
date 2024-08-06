import 'package:admin_rent/controllers/providers/searchfilter/search_filter_provider.dart';
import 'package:admin_rent/view/vehiclelist/widgets/filteroptions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  Provider.of<SearchFilterProvider>(context, listen: false)
                      .setSearchQuery(value);
                },
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
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const FilterOptionsWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
