import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddClassView extends ConsumerStatefulWidget {
  const AddClassView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddClassViewState();
}

class AddClassViewState extends ConsumerState<AddClassView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add class Page (schedule/views/add_class.dart)',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
