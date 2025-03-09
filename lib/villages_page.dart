import 'package:flutter/material.dart';
import 'patient_list_page.dart';
import 'package:flutter/services.dart';

class VillagesPage extends StatefulWidget {
  final List<Map<String, dynamic>> villages;

  VillagesPage({Key? key, required this.villages}) : super(key: key);

  @override
  _VillagesPageState createState() => _VillagesPageState();
}

class _VillagesPageState extends State<VillagesPage> {
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextField(
                controller: criticalController,
                decoration: InputDecoration(labelText: 'No. of Critical Patients'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    'patients': [], // Empty patient list for new village
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

  void _deleteVillage(int index) {
    setState(() {
      widget.villages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Villages')),
      body: widget.villages.isEmpty
          ? Center(child: Text('No villages added yet'))
          : ListView.builder(
              itemCount: widget.villages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.villages[index]['name']),
                  subtitle: Text(
                    'People: ${widget.villages[index]['population']} | Critical Patients: ${widget.villages[index]['critical']}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteVillage(index),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientListPage(village: widget.villages[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addVillage,
        child: Icon(Icons.add),
      ),
    );
  }
}