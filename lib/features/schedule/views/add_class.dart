import 'package:coursepilot/theme/color_theme.dart';
import 'package:coursepilot/theme/theme.dart';
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
      style: ElevatedButton.styleFrom(backgroundColor: AppColorsDark.primary),

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

  @override
  Widget build(BuildContext context) {
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
                        ? SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(
                                    context,
                                  ).custom.colorTheme.foreground,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              labelText: 'Search Spring 2025 Classes',
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColorsDark.dirtyWhite,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.filter_list_alt,
                                  color: AppColorsDark.dirtyWhite,
                                ),
                              ),
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Class',
                        style:
                            Theme.of(context).custom.textTheme.titleLargeBold,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              Theme.of(context).custom.colorTheme.foreground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: 'Search Spring 2025 Classes',
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColorsDark.dirtyWhite,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list_alt,
                            color: AppColorsDark.dirtyWhite,
                          ),
                        ),
                      ),
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
              color: Theme.of(context).custom.colorTheme.foreground,
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
                            style:
                                Theme.of(context).custom.textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: classData['classSection'] as String,
                                style: TextStyle(color: AppColorsDark.primary),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          classData['classSchedule'] as String,
                          style: Theme.of(context).custom.textTheme.subtitle1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      classData['classTitle'] as String,
                      style: Theme.of(context).custom.textTheme.bodyText1,
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
                          style: Theme.of(context).custom.textTheme.subtitle2,
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
