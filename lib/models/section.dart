import 'availability.dart';
import 'schedule.dart';
import 'instructor.dart';

class Section {
    final int number;
    final String component;
    final int class_id;
    final Availability availability;
    final Schedule? schedule;
    final String location;
    final List<Instructor> instructor;
    final DateTime begin_date;
    final DateTime end_date;
    final String notes;
    final String requisites;
    final String restrictions;


    Section({
      required this.number,
      required this.component,
      required this.class_id,
      required this.availability,
      this.schedule,
      required this.location,
      required this.instructor,
      required this.begin_date,
      required this.end_date,
      required this.notes,
      required this.requisites,
      required this.restrictions,
    });
}