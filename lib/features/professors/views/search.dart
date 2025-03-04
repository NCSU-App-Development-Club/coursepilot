import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SearchViewState();
}

class SearchViewState extends ConsumerState<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Professors Page (professors/views/search.dart)',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
