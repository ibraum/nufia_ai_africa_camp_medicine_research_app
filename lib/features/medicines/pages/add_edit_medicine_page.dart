import 'package:flutter/material.dart';

class AddEditMedicinePage extends StatelessWidget {
  const AddEditMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add / Edit Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Price')),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Stock')),
            SizedBox(height: 12),
            ElevatedButton(onPressed: null, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
