import 'package:doctocms/Models/Doctormodel.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DoctorList extends StatelessWidget {
  DoctorList({super.key});

  final List<Doctor> doctors = [
    Doctor(name: 'Muhammed Iqbal VM'),
    Doctor(name: 'Shafeeq V'),
    Doctor(name: 'Krishna Das'),
    Doctor(name: 'Aishwarya V'),
    Doctor(name: 'Bijeesh BDS'),
    Doctor(name: 'Irsad Ahmed'),
    Doctor(name: 'Dr. Pratheesh MBBS,MD'),
    Doctor(name: 'Sarath V'),

    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        //title: Image.asset("Images/title_logo.png"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Transform.scale(
          scale: 0.5, // Adjust the scale factor as needed
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/Images/title_logo.png', // Replace with your image path
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Doctors List",
              style: TextStyle(
                fontSize: 25,
                color: appColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 10),
                    child: ListTile(
                      title: Text(doctors[index].name),
                      // You can add more information like specialty, location, etc.
                      // as needed inside the ListTile.
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
