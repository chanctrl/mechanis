import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> villages;

  HomePage({Key? key, required this.villages}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addVillage() {
    TextEditingController nameController = TextEditingController();
    TextEditingController populationController = TextEditingController();
    TextEditingController criticalController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Village'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Village Name')),
              TextField(
                controller: populationController,
                decoration: InputDecoration(labelText: 'No. of People'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: criticalController,
                decoration: InputDecoration(labelText: 'No. of Critical Patients'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.villages.add({
                    'name': nameController.text,
                    'population': int.tryParse(populationController.text) ?? 0,
                    'critical': int.tryParse(criticalController.text) ?? 0,
                    'patients': [],
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addVillage,
        child: Icon(Icons.add),
      ),
      body: Center(child: Text("Welcome to Home Page")),
    );
  }
}
