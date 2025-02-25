import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp_withapi/bloc/book_cubit.dart';
import 'package:libraryapp_withapi/repository/book_repository.dart';
import 'package:libraryapp_withapi/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITBook Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.black12),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BookCubit>(
            create: (context) => BookCubit(BookRepository()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
