import 'package:code_juge/utils/exercise_datamodell.dart';

// This file contains all exercises and their data
class MyExercises {
  final List<ExerciseDatamodell> exercises = [
    ExerciseDatamodell(
      name: "Test",
      description: "Just for testing",
      task: "Develop a programm, which returns 42.",
      solution: "42",
      difficultyLevel: 0
    )
  ];

  List<ExerciseDatamodell> getAllExercises(){
    return exercises;
  }
}
