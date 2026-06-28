📋 To Do App using Cubit

A simple and clean To Do application built with Flutter using Cubit State Management.

---

📱 Features

- Add a new task
- Delete a task
- Display all tasks
- Automatically update the UI using Cubit
- Mark tasks as completed ✅
- Show total tasks
- Show completed and pending tasks
- Confirmation dialog before deleting
- SnackBar for user feedback
- Clean and modern UI

---

🛠 Technologies Used

- Flutter
- Dart
- flutter_bloc (Cubit)

---

📂 Project Structure

lib/
│
├── cubit/
│ ├── task_cubit.dart
│ └── task_state.dart
│
├── model/
│ └── task_model.dart
│
├── screens/
│ └── home_screen.dart
│
├── widgets/
│ └── task_item.dart
│
└── main.dart

---
🔄 Application Flow

1. User enters a task.
2. User presses the Add Task button.
3. Cubit adds the task to the list.
4. Cubit emits a new state.
5. BlocBuilder rebuilds the UI automatically.
6. User can complete or delete any task.

---

🎁 Bonus Features

- Mark task as completed
- Total tasks counter
- Completed tasks counter
- Pending tasks counter
- Delete confirmation dialog
- SnackBar messages

---

 👩‍💻 Developed By

Fareeda Mohamed
