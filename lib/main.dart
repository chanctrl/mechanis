import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VillagesScreen(),
    );
  }
}

class VillagesScreen extends StatefulWidget {
  @override
  _VillagesScreenState createState() => _VillagesScreenState();
}

class _VillagesScreenState extends State<VillagesScreen> {
  List<dynamic> villages = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonString =
        await rootBundle.rootBundle.loadString('./assets/sample.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      villages = jsonData['villages'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Villages")),
      body: villages.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: villages.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(villages[index]['name']),
                    subtitle: Text(
                        "Population: ${villages[index]['population']}\nCritical Condition: ${villages[index]['critical_condition']}"),
                  ),
                );
              },
            ),
    );
  }
}
