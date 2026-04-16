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
              IconButton.outlined(onPressed: null, icon: Icon(Icons.notifications)),
              IconButton.outlined(onPressed: null, icon: Icon(Icons.keyboard_arrow_down)),
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
          Row( //Time to meet
            spacing: 20,
            children: [
              IconButton.outlined(onPressed: null, icon: Icon(Icons.schedule)),
              Text("Mon, Wed 10:15 AM - 11:30 AM",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Row( //Location
            spacing: 20,
            children: [
              IconButton.outlined(onPressed: null, icon: Icon(Icons.location_on)),
              Text("(Centennial Campus) Hill Library 4016",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(//Instructor name
            spacing: 20,
            children: [
              IconButton.outlined(onPressed: null, icon: Icon(Icons.person)),
              Text("Jamie Jennings",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Row(//Seats available
            spacing: 20,
            children: [
              IconButton.outlined(onPressed: null, icon: Icon(Icons.groups)),
              Text("Closed, 0/50 seats available",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.red,
                )
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
