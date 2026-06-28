import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_cubit.dart';
import '../model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final int index;

  const TaskItem({
    super.key,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          activeColor: Colors.blue,
          onChanged: (_) {
            context.read<TaskCubit>().toggleTask(index);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: task.isCompleted
                ? Colors.green
                : Colors.black,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Delete Task"),
                content: const Text(
                  "Are you sure you want to delete this task?",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TaskCubit>().deleteTask(index);

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Task Deleted"),
                        ),
                      );
                    },
                    child: const Text("Delete"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}