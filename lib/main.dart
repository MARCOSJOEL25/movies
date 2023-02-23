import 'package:flutter/material.dart';
import 'package:movies/providers/movies_providers.dart';
import 'package:movies/screens/screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false,),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
      home: HomeScreen(),
      initialRoute: 'Home',
      routes: {
        'Home': (_) => HomeScreen(),
        'Details': (_) => DetailsScreen(),
      },
    );
  }
}
