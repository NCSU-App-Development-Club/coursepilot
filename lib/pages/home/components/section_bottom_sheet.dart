import 'package:flutter/material.dart';

class SectionBottomSheet extends StatelessWidget {
  const SectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton.outlined(onPressed: null, icon: Icon(Icons.delete)),
              IconButton.outlined(onPressed: null, icon: Icon(Icons.delete)),
              IconButton.outlined(onPressed: null, icon: Icon(Icons.delete)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CSC 316 (002)",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Data Structures & Algorithms",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: null,
            label: Text("View more"),
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
