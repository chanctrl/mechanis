import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientListPage extends StatefulWidget {
  final Map<String, dynamic> village;

  PatientListPage({Key? key, required this.village}) : super(key: key);

  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  void _addPatient() {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController doctorController = TextEditingController();
    TextEditingController doctorContactController = TextEditingController();
    TextEditingController patientContactController = TextEditingController();
    TextEditingController conditionController = TextEditingController();
    TextEditingController diagnosisController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Patient'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameController, decoration: InputDecoration(labelText: 'Patient Name')),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextField(controller: genderController, decoration: InputDecoration(labelText: 'Gender')),
                TextField(controller: doctorController, decoration: InputDecoration(labelText: 'Doctor Name')),
                TextField(
                  controller: doctorContactController,
                  decoration: InputDecoration(labelText: 'Doctor Contact'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: patientContactController,
                  decoration: InputDecoration(labelText: 'Patient Contact'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: conditionController,
                  decoration: InputDecoration(labelText: 'Condition (1-5)'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextField(controller: diagnosisController, decoration: InputDecoration(labelText: 'Diagnosis')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.village['patients'].add({
                    'name': nameController.text,
                    'age': int.tryParse(ageController.text) ?? 0,
                    'gender': genderController.text,
                    'doctor': doctorController.text,
                    'doctorContact': doctorContactController.text,
                    'patientContact': patientContactController.text,
                    'condition': int.tryParse(conditionController.text) ?? 1,
                    'diagnosis': diagnosisController.text,
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
    List<dynamic> patients = widget.village['patients'];

    return Scaffold(
      appBar: AppBar(title: Text('Patients in ${widget.village['name']}')),
      body: patients.isEmpty
          ? Center(child: Text('No patients recorded yet'))
          : ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(patients[index]['name']),
                  subtitle: Text(
                    'Condition: ${patients[index]['condition']} | Doctor: ${patients[index]['doctor']}',
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPatient,
        child: Icon(Icons.person_add),
      ),
    );
  }
}
