import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddClassView extends ConsumerStatefulWidget {
  const AddClassView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddClassViewState();
}

class AddClassViewState extends ConsumerState<AddClassView> {
  // bool addClassButton = false;

  Container _classTerms(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _classSeats(String seats) {
    return Row(
      children: [
        Icon(Icons.chair_alt, color: Colors.white),
        SizedBox(width: 4),
        Text(seats, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // No functionality yet
  ElevatedButton _addRemoveClass() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),

      onPressed: () {},
      child: Icon(Icons.add, size: 30),
    );
  }

  // TODO: add more color schemas
  Color _profRankColor(int number) {
    if (number > 50) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  Widget _buildSearchBar() {
    return SearchBar(hintText: "Search Spring 2025 Classes");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 190.0,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              // print(constraints.maxHeight); SliverAppBar expanded height
              final double collapsePercent =
                  (constraints.maxHeight - kToolbarHeight) /
                  (190.0 - kToolbarHeight);

              final bool isCollapsed = collapsePercent <= 0.8;

              return FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title:
                    isCollapsed
                        ? SizedBox(height: 50, child: _buildSearchBar())
                        : const SizedBox.shrink(),
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Class',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            var classData = dummyAPI['classes']![index];
            var terms = classData['terms'] as List<String>;

            return Card(
              color: theme.colorScheme.surfaceContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // class information
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${classData['className']} - ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: classData['classSection'] as String,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          classData['classSchedule'] as String,
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      classData['classTitle'] as String,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),

                    // professor
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: _profRankColor(
                            classData['profRank'] as int,
                          ),
                          child: Text(
                            '${classData['profRank']}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          classData['profName'] as String,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),

                    // term and seats
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _classTerms(terms[0], Colors.green),
                        SizedBox(width: 8),
                        _classTerms(terms[1], Colors.brown),
                        SizedBox(width: 8),
                        _classSeats(
                          '${classData['openSeats']}/${classData['maxSeats']}',
                        ),
                        Spacer(),
                        _addRemoveClass(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }, childCount: dummyAPI['classes']!.length),
        ),
      ],
    );
  }
}

const dummyAPI = {
  "classes": [
    {
      "className": "CSC 522",
      "classSection": "002",
      "classSchedule": "MW 4:30PM - 5:45PM",
      "classTitle": "Automated Learning and Data Analysis",
      "profRank": 62,
      "profName": "Thomas Price",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
    {
      "className": "CSC 510",
      "classSection": "001",
      "classSchedule": "MW 11:45AM - 1:00PM",
      "classTitle": "Software Engineering",
      "profRank": 39,
      "profName": "Timothy Menzies",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
    {
      "className": "CSC 510",
      "classSection": "001",
      "classSchedule": "MW 11:45AM - 1:00PM",
      "classTitle": "Software Engineering",
      "profRank": 39,
      "profName": "Timothy Menzies",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
    {
      "className": "CSC 510",
      "classSection": "001",
      "classSchedule": "MW 11:45AM - 1:00PM",
      "classTitle": "Software Engineering",
      "profRank": 39,
      "profName": "Timothy Menzies",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
    {
      "className": "CSC 510",
      "classSection": "001",
      "classSchedule": "MW 11:45AM - 1:00PM",
      "classTitle": "Software Engineering",
      "profRank": 39,
      "profName": "Timothy Menzies",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
    {
      "className": "CSC 510",
      "classSection": "001",
      "classSchedule": "MW 11:45AM - 1:00PM",
      "classTitle": "Software Engineering",
      "profRank": 39,
      "profName": "Timothy Menzies",
      "terms": ["Spring", "Fall"],
      "openSeats": 48,
      "maxSeats": 60,
    },
  ],
};
