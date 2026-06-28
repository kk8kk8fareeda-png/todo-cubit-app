import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task_model.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(tasks: []));

  void addTask(String title) {
    List<TaskModel> updatedTasks = List.from(state.tasks);

    updatedTasks.add(
      TaskModel(title: title),
    );

    emit(
      TaskState(tasks: updatedTasks),
    );
  }

  void deleteTask(int index) {
    List<TaskModel> updatedTasks = List.from(state.tasks);

    updatedTasks.removeAt(index);

    emit(
      TaskState(tasks: updatedTasks),
    );
  }

  void toggleTask(int index) {
    List<TaskModel> updatedTasks = List.from(state.tasks);

    updatedTasks[index].isCompleted =
        !updatedTasks[index].isCompleted;

    emit(
      TaskState(tasks: updatedTasks),
    );
  }

  int get completedTasks =>
      state.tasks.where((task) => task.isCompleted).length;

  int get pendingTasks =>
      state.tasks.where((task) => !task.isCompleted).length;
}