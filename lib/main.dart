import 'package:flutter/material.dart';
import 'package:uas_nomor5/model/course_reminder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screen/info.dart';
main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CoursereminderAdapter());
  await Hive.openBox('boxkuliah');
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}