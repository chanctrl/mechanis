import 'package:flutter/material.dart';

class PatientHistoryPage extends StatelessWidget {
  final Map<String, dynamic> village;

  // This can be customized for each patient. Example assumes a simple history.
  PatientHistoryPage({required this.village});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medical History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // You can change this to dynamically load the history
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text('Visit ${index + 1}'),
                      subtitle: Text('Diagnosis: ${['Flu', 'Cold', 'Covid'][index % 3]}'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        // Optionally navigate to individual medical record details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
