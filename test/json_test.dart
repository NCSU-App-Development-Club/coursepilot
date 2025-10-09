import 'package:coursepilot/models/course.dart';
import 'package:coursepilot/models/schedule.dart';
import 'package:coursepilot/models/section.dart';
import 'package:test/test.dart';
import 'package:coursepilot/models/availability.dart';
import 'package:coursepilot/models/instructor.dart';

void main() {
  test('test instructor json', () {
    final instructor = Instructor(name: "Dr. King", webpage: "https://example.com");
    final json = {"name": "Dr. King", "webpage": "https://example.com"};

    expect(instructor, Instructor.fromJson(json));
  });

  test('test availability json', () {
    final availability = Availability(status: "Open", capacity: 30, enrolled: 25, waitlisted: 5);
    final json = {"status": "Open", "capacity": 30, "enrolled": 25, "waitlisted": 5};

    expect(availability, Availability.fromJson(json));
  });

  test('test course json', () {

    Section section = Section(
      number: "001",
      component: "Lec",
      class_id: 12345,
      availability: Availability(status: "Open", capacity: 30, enrolled: 25, waitlisted: 5),
      schedule: null, // Assuming schedule is null for this test
      location: "Room 101",
      instructor: [Instructor(name: "Dr. King", webpage: "https://example.com")],
      begin_date: DateTime(2025, 1, 1),
      end_date: DateTime(2025, 5, 1),
      notes: "Notes",
      requisites: "None",
      restrictions: "None",
    );

    final course = Course(
      subject: "CS",
      code: 101,
      name: "Intro to Computer Science",
      description: "An introduction to computer science.",
      credits: 3,
      sections: [section,] // Assuming sections are empty for this test
    );
    final json = {
      "subject": "CS",
      "code": 101,
      "name": "Intro to Computer Science",
      "description": "An introduction to computer science.",
      "credits": 3,
      "sections": [
        {
          "number": "001",
          "component": "Lec",
          "class_id": 12345,
          "availability": {
            "status": "Open",
            "capacity": 30,
            "enrolled": 25,
            "waitlisted": 5
          },
          "schedule": null, // Assuming schedule is null for this test
          "location": "Room 101",
          "instructor": [
            {"name": "Dr. King", "webpage": "https://example.com"}
          ],
          "begin_date": DateTime(2025, 1, 1).toIso8601String(),
          "end_date": DateTime(2025, 5, 1).toIso8601String(),
          "notes": "Notes",
          "requisites": "None",
          "restrictions": "None"
        }
      ], // Assuming sections are empty for this test
    };

    expect(course, Course.fromJson(json));
  });

  test('test section json', () {
    final section = Section(
      number: "001",
      component: "Lec",
      class_id: 12345,
      availability: Availability(status: "Open", capacity: 30, enrolled: 25, waitlisted: 5),
      schedule: null, // Assuming schedule is null for this test
      location: "Room 101",
      instructor: [Instructor(name: "Dr. King", webpage: "https://example.com")],
      begin_date: DateTime(2025, 1, 1),
      end_date: DateTime(2025, 5, 1),
      notes: "Notes",
      requisites: "None",
      restrictions: "None",
    );
    final json = {
      "number": "001",
      "component": "Lec",
      "class_id": 12345,
      "availability": {
        "status": "Open",
        "capacity": 30,
        "enrolled": 25,
        "waitlisted": 5
      },
      "schedule": null, // Assuming schedule is null for this test
      "location": "Room 101",
      "instructor": [
        {"name": "Dr. King", "webpage": "https://example.com"}
      ],
      "begin_date": DateTime(2025, 1, 1).toIso8601String(),
      "end_date": DateTime(2025, 5, 1).toIso8601String(),
      "notes": "Notes",
      "requisites": "None",
      "restrictions": "None"
    };

    expect(section, Section.fromJson(json));
  });

  test("test schedule json", () {
    final schedule = Schedule(
      days: ["Monday", "Wednesday"],
      begin_time: DateTime(2025, 1, 1, 9, 0),
      end_time: DateTime(2025, 1, 1, 10, 30),
    );
    
    final json = {
      "days": ["Monday", "Wednesday"],
      "begin_time": DateTime(2025, 1, 1, 9, 0).toIso8601String(),
      "end_time": DateTime(2025, 1, 1, 10, 30).toIso8601String(),
    };

    expect(schedule, Schedule.fromJson(json));
  });
}