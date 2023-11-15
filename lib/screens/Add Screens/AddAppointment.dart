import 'package:doctocms/Models/Doctormodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../../constants/colors.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String? selectedDoctor;
  final TextEditingController PurposeOfVisit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        title: const Text('dosctosmart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FormBuilder(
        key: _fbKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Appointment",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: appColor),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration:BoxDecoration(
                  color: appColor, // Set the background color
                  borderRadius: BorderRadius.circular(10.0), 
                  // Set the border radius
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDoctor,
                  items: doctors.map((Doctor doctor) {
                    return DropdownMenuItem<String>(
                      value: doctor.name,
                      child: Text(doctor.name),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDoctor = newValue;
                      
                    });
                  },
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: appColor),
                padding: const EdgeInsets.all(16.0),
                child: FormBuilderDateTimePicker(
                  name: 'appointment_date',
                  inputType: InputType.date,
                  format: DateFormat('dd-mm-yyyy'),
                  decoration: const InputDecoration(
                      //labelText: 'Select appointment date',
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Time",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: appColor),
                padding: const EdgeInsets.all(16.0),
                child: FormBuilderDateTimePicker(
                  name: 'appointment_time',
                  inputType: InputType.time,
                  format: DateFormat('mm:HH'), // Use a time format
                  decoration: InputDecoration(
                    //labelText: 'Select appointment time',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Purpose of Visit",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: appColor),
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: PurposeOfVisit,
                  decoration: const InputDecoration(
                    //labelText: labelText,
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                height: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: appColor),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                  ),
                  onPressed: () {
                    // _login(context)
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
