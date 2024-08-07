import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/services/api_service.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:blog_explorer/bloc/favorite_bloc.dart';
import 'package:blog_explorer/screens/blog_list_screen.dart';

import 'bloc/blog_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlogBloc(ApiService())..add(FetchBlogs()),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog Explorer',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
          ),
        ),
        home: BlogListScreen(),
      ),
    );
  }
}
