import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/task_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          scaffoldBackgroundColor: const Color(0xffF5F7FA),
        ),
        home: HomeScreen(),
      ),
    );
  }
}