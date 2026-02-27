import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subsense',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B8E23),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      home: const HomePage(),
    );
  }
}
