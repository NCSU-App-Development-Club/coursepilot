import 'package:coursepilot/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

/// A service to manage locally planned schedules.
class ScheduleService {
  final Box<String> _scheduleBox;
  final _uuid = const Uuid();

  static const _selectedKey = '__selected_schedule_id__';

  /// Injects the Hive box used for storing schedules.
  ScheduleService(this._scheduleBox);

  /// The currently selected schedule ID, or null if none is selected.
  String? get selectedScheduleId => _scheduleBox.get(_selectedKey);

  /// Selects a schedule by ID. If the ID doesn't correspond to an existing
  /// schedule, the selection is cleared.
  void selectSchedule(String id) {
    if (_scheduleBox.containsKey(id)) {
      _scheduleBox.put(_selectedKey, id);
    } else {
      _scheduleBox.delete(_selectedKey);
    }
  }

  /// Clears the current schedule selection.
  void clearSelection() {
    _scheduleBox.delete(_selectedKey);
  }

  /// Returns the currently selected schedule, or null if nothing is selected
  /// or the selected schedule no longer exists.
  PlannedSchedule? getSelectedSchedule() {
    final id = selectedScheduleId;
    if (id == null) return null;

    final json = _scheduleBox.get(id);
    if (json == null) {
      // Selected schedule was deleted — clean up stale reference.
      _scheduleBox.delete(_selectedKey);
      return null;
    }
    return PlannedScheduleMapper.fromJson(json);
  }

  /// Retrieves all locally planned schedules.
  List<PlannedSchedule> getSchedules() {
    return _scheduleBox.keys
        .where((key) => key != _selectedKey)
        .map((key) => PlannedScheduleMapper.fromJson(_scheduleBox.get(key)!))
        .toList();
  }

  /// Retrieves a specific planned schedule by its unique ID.
  PlannedSchedule? getSchedule(String id) {
    final json = _scheduleBox.get(id);
    if (json == null) return null;
    return PlannedScheduleMapper.fromJson(json);
  }

  /// Creates a new planned schedule and returns it.
  PlannedSchedule createSchedule({
    required String name,
    required String semester,
  }) {
    final schedule = PlannedSchedule(
      id: _uuid.v4(),
      name: name,
      semester: semester,
    );
    _scheduleBox.put(schedule.id, schedule.toJson());
    return schedule;
  }

  /// Deletes a planned schedule by its ID.
  /// If the deleted schedule was selected, the selection is cleared.
  void deleteSchedule(String id) {
    _scheduleBox.delete(id);
    if (selectedScheduleId == id) {
      _scheduleBox.delete(_selectedKey);
    }
  }

  /// Adds a course section to a planned schedule.
  /// Throws [StateError] if the schedule does not exist.
  void addSectionToSchedule(String scheduleId, SavedSection section) {
    final schedule = getSchedule(scheduleId);
    if (schedule == null) {
      throw StateError('Schedule $scheduleId not found');
    }

    // Avoid duplicates.
    final alreadyExists = schedule.sections.any(
      (s) =>
          s.coursePrefix == section.coursePrefix &&
          s.courseNumber == section.courseNumber &&
          s.sectionNumber == section.sectionNumber &&
          s.semester == section.semester,
    );
    if (alreadyExists) return;

    final updated = schedule.copyWith(
      sections: [...schedule.sections, section],
    );
    _scheduleBox.put(scheduleId, updated.toJson());
  }

  /// Removes a course section from a planned schedule.
  /// Throws [StateError] if the schedule does not exist.
  void removeSectionFromSchedule(String scheduleId, SavedSection section) {
    final schedule = getSchedule(scheduleId);
    if (schedule == null) {
      throw StateError('Schedule $scheduleId not found');
    }

    final updated = schedule.copyWith(
      sections: schedule.sections
          .where(
            (s) =>
                !(s.coursePrefix == section.coursePrefix &&
                    s.courseNumber == section.courseNumber &&
                    s.sectionNumber == section.sectionNumber &&
                    s.semester == section.semester),
          )
          .toList(),
    );
    _scheduleBox.put(scheduleId, updated.toJson());
  }
}
