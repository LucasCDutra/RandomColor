import 'package:flutter/material.dart';
import 'package:random_color_solid_task/views/home/home_view.dart';

/// Entry point of the application.
void main() {
  runApp(const RandomColorMain());
}

/// Main class that defines the structure of the application.
class RandomColorMain extends StatelessWidget {
  /// Default constructor of the class.
  const RandomColorMain({
    super.key,
  });

  /// Method that builds the user interface of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solid Task - Random Color',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
