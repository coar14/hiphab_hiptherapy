import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveProgramsNotifier extends StateNotifier<List<Map<String, String>>> {
  ActiveProgramsNotifier() : super([]);

  void addProgram(Map<String, String> program) {
    state = [...state, program];
  }
}

final activeProgramsProvider =
    StateNotifierProvider<ActiveProgramsNotifier, List<Map<String, String>>>(
        (ref) {
  return ActiveProgramsNotifier();
});

class WeeklySummaryNotifier extends StateNotifier<List<double>> {
  WeeklySummaryNotifier() : super([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);

  void updateExercise(int dayIndex, double amount) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == dayIndex) state[i] + amount else state[i],
    ];
  }
}

final weeklySummaryProvider = StateNotifierProvider<WeeklySummaryNotifier, List<double>>((ref) {
  return WeeklySummaryNotifier();
});

final exerciseProgressProvider = StateProvider<double>((ref) => 0.0);
final painLevelProvider = StateProvider<double>((ref) => 0.0);
final programStartedProvider = StateProvider<bool>((ref) => false);
final currentDayProvider = StateProvider<int>((ref) => 1);
final currentExerciseIndexProvider = StateProvider<int>((ref) => 0);

