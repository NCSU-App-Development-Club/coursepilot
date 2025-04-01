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

  // regular button for now
  ElevatedButton _addRemoveClass() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColorsDark.primary),
      //   backgroundColor:
      //       addClassButton ? Colors.red.shade900 : AppColorsDark.primary,
      // ),
      onPressed: () {
        // setState(() {
        //   addClassButton = !addClassButton;
        // });
      },
      child: Icon(Icons.add, size: 30),
      // child: Icon(addClassButton ? Icons.remove : Icons.add, size: 30),
    );
  }

  // TODO: ask about color schema
  Color _profRankColor(int number) {
    if (number > 50) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Add Class',
              // style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              style: Theme.of(context).custom.textTheme.titleLargeBold,
            ),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).custom.colorTheme.foreground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              labelText: 'Search Spring 2025 Classes',
              prefixIcon: Icon(Icons.search, color: AppColorsDark.dirtyWhite),
              suffixIcon: Icon(
                Icons.filter_list_alt,
                color: AppColorsDark.dirtyWhite,
              ),
            ),
          ),
          SizedBox(height: 12),
          // using dummy api for now
          Expanded(
            child: ListView.builder(
              itemCount: dummyAPI['classes']!.length,
              itemBuilder: (context, index) {
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
                                    Theme.of(
                                      context,
                                    ).custom.textTheme.titleMedium,
                                children: [
                                  TextSpan(
                                    text: classData['classSection'] as String,
                                    style: TextStyle(
                                      color: AppColorsDark.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              classData['classSchedule'] as String,
                              style:
                                  Theme.of(context).custom.textTheme.subtitle1,
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
                              style:
                                  Theme.of(context).custom.textTheme.subtitle2,
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
              },
            ),
          ),
        ],
      ),
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
  ],
};
