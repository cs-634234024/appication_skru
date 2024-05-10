import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skru/app.dart';
import 'package:skru/providers/history_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return HistoryProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade50),
          useMaterial3: true,
        ),
        home: const App(),
      ),
    );
  }
}
