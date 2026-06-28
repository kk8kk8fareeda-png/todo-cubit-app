import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_cubit.dart';
import '../cubit/task_state.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "📋 My Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter your task",
                prefixIcon: const Icon(Icons.edit_note),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;

                  context.read<TaskCubit>().addTask(controller.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Task Added Successfully"),
                    ),
                  );

                  controller.clear();
                },
                child: const Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state.tasks.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_alt,
                            size: 90,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "No Tasks Yet",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Add your first task 😊",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        task: state.tasks[index],
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.blue.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(Icons.list),
                              Text(
                                "${state.tasks.length}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Total"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Card(
                        color: Colors.green.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(Icons.check_circle),
                              Text(
                                "${cubit.completedTasks}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Completed"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Card(
                        color: Colors.orange.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(Icons.pending_actions),
                              Text(
                                "${cubit.pendingTasks}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Pending"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}