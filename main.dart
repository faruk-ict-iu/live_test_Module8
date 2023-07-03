import 'package:flutter/material.dart';

class Contact {
  String name;
  String email;
  String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '5678901234',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '12345678901',
    ),
    Contact(
      name: 'Alice Johnson',
      email: 'alice@example.com',
      phoneNumber: '4567890123',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text('Name: ${contact.name}'),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 4.0),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }
}
