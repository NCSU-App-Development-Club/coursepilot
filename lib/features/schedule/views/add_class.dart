import 'package:coursepilot/features/schedule/repositories/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
yo, Eric here.

This was originally a bit different, but I've modified it
to use the new theme system. Essentially, using Theme.of(context).colorScheme
is nice because it's reactive to the system's theme. This means
that implementing light theme is also quite easy,
if you use this correctly.

For example, Theme.of(context).colorScheme.surface is the background color.
you can then use .colorScheme.onSurface, which is vaguely an inverse of surface.
This means that anything with the `onSurface` color will always be visible on
a `surface`. Flutter itself handles the exact generation of this when I generate
the theme via .fromSeed in main.dart.
*/

class AddClassView extends ConsumerStatefulWidget {
  const AddClassView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddClassViewState();
}

class AddClassViewState extends ConsumerState<AddClassView> {
  // bool addClassButton = false;

  Container _buildClassTerms(String text, Color color) {
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

  Row _buildClassSeats(String seats) {
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
        foregroundColor: Theme.of(context).colorScheme.surface,
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
    final courses = ref.watch(coursesProvider);

    return Scaffold(
      body: CustomScrollView(
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
                          _buildClassTerms(terms[0], Colors.green),
                          SizedBox(width: 8),
                          _buildClassTerms(terms[1], Colors.brown),
                          SizedBox(width: 8),
                          _buildClassSeats(
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
      ),
    );
  }
}

/*
While this was definitely useful for the individual that wrote it,
but it should likely be changed. In the lib/models folder,
there should be models to correctly represent the actual data
that will be fetched. In general, one should never directly
fetch data from an API and simply use the json response. You
first want to put it into a model. This part is easier with
dart_mappable, a library we use for that very reason.
*/
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
