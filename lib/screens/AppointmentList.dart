import 'package:doctocms/constants/colors.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatelessWidget {
  
  const AppointmentList({super.key});

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
            // Handle back button press
            Navigator.pop(context);

          },
        ),
        titleSpacing: 0,
        title: Transform.scale(
            scale: 0.5, // Adjust the scale factor as needed
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'Images/title_logo.png', // Replace with your image path
              ),
            ),
          ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20,left: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Appointments",style: TextStyle(
              fontSize: 21,color: appColor,
            ),),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.center,
              child: Text("Appointment Not Found",style: TextStyle(color: appColor),)
              )
          ],
        ),
        ),
    );
  }
}
