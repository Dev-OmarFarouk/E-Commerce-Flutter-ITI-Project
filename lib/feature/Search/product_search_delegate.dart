import 'package:flutter/material.dart';
import '../../core/resources/ProductCard.dart';
import '../../core/resources/search_helper.dart';

class ProductSearchDelegate extends SearchDelegate<String?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) return null;
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      const cats = ['Tech', 'Shoes', 'Clothes'];
      return ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cats[index]),
            onTap: () {
              query = cats[index];
              showResults(context);
            },
          );
        },
      );
    }

    final results = filterProducts(query);
    if (results.isEmpty) {
      return const Center(child: Text('No suggestions'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title),
          onTap: () {
            query = results[index].title;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = filterProducts(query);

    if (results.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Results for " $query "'),
              Text(
                '${results.length} Results Found',
                style: const TextStyle(color: Color(0xff6055D8)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: results.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: results[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
