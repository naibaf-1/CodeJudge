// This defines which values an exercise has
class ExerciseDatamodell {
  final String name;
  final String description;
  final String task;
  final String solution;
  final int difficultyLevel;
  final String hint;

  ExerciseDatamodell({
    required this.name,
    required this.description,
    required this.task,
    required this.solution,
    required this.difficultyLevel,
    this.hint = "No hint available.",
  });
}
