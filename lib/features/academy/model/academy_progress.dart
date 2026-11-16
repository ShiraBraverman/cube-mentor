import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/settings/preferences.dart';
import 'lesson.dart';
import 'lesson_catalog.dart';

/// Which lessons are finished and where the learner left off. Stored
/// locally (shared preferences); there are no accounts.
@immutable
class AcademyProgress {
  const AcademyProgress({this.completed = const {}, this.lastLesson});

  final Set<String> completed;

  /// The lesson opened most recently.
  final String? lastLesson;

  int get completedCount =>
      kLessons.where((l) => completed.contains(l.id)).length;

  bool isDone(String lessonId) => completed.contains(lessonId);

  /// The lesson to continue with: the first unfinished one at or after the
  /// last opened lesson, else the first unfinished one overall. Null once
  /// every lesson is done.
  Lesson? get nextLesson {
    final last = kLessons.indexWhere((l) => l.id == lastLesson);
    for (var i = last < 0 ? 0 : last; i < kLessons.length; i++) {
      if (!completed.contains(kLessons[i].id)) return kLessons[i];
    }
    for (final lesson in kLessons) {
      if (!completed.contains(lesson.id)) return lesson;
    }
    return null;
  }
}

class AcademyProgressController extends Notifier<AcademyProgress> {
  static const _completedKey = 'academy_completed';
  static const _lastKey = 'academy_last';

  @override
  AcademyProgress build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return AcademyProgress(
      completed: (prefs.getStringList(_completedKey) ?? const []).toSet(),
      lastLesson: prefs.getString(_lastKey),
    );
  }

  Future<void> open(String lessonId) async {
    state = AcademyProgress(completed: state.completed, lastLesson: lessonId);
    await ref.read(sharedPreferencesProvider).setString(_lastKey, lessonId);
  }

  Future<void> complete(String lessonId) async {
    final completed = {...state.completed, lessonId};
    state = AcademyProgress(completed: completed, lastLesson: lessonId);
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setStringList(_completedKey, completed.toList()..sort());
    await prefs.setString(_lastKey, lessonId);
  }
}

final academyProgressProvider =
    NotifierProvider<AcademyProgressController, AcademyProgress>(
      AcademyProgressController.new,
    );

/// Index of a lesson in [kLessons], or -1.
int lessonIndex(String id) => kLessons.indexWhere((l) => l.id == id);
