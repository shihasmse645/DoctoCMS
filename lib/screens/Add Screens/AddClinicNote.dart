import 'package:flutter/material.dart';
import '../../Models/Doctormodel.dart';
import '../../constants/colors.dart';
import '../../widgets/ComplaintSuggestion.dart';
import '../../widgets/observationSuggestion.dart';

class AddClinicNote extends StatefulWidget {
  const AddClinicNote({super.key});

  @override
  State<AddClinicNote> createState() => _AddClinicNoteState();
}

class _AddClinicNoteState extends State<AddClinicNote> {
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController observationController = TextEditingController();
  final TextEditingController investigationController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String? selectedDoctor;
  void updatecomplaint(String result) {
    setState(() {
      complaintController.text = result;
    });
  }

  void updateobservation(String result) {
    setState(() {
      observationController.text = result;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 7, right: 7, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Clinic Note",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: appColor),
              ),
              const SizedBox(
                height: 8,
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
                "Complaint",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 150,
                      controller: complaintController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counter: SizedBox.shrink(),
                          contentPadding: EdgeInsets.symmetric(
                           horizontal: 8.0,
                          ),
                          ),
                          
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate:
                                    ComplaintSuggestions(updatecomplaint));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Observation",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 150,
                      controller: observationController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counter: SizedBox.shrink(),
                          contentPadding: EdgeInsets.symmetric(
                           horizontal: 8.0,
                          ),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate:
                                    ObservationSuggestions(updateobservation));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Investigation",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
               
                child: Column(                 
                  children: [
                    TextField(
                      maxLength: 150,
                      controller: investigationController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counter: SizedBox.shrink(),
                          contentPadding: EdgeInsets.symmetric(
                           horizontal: 8.0,
                          ),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {
                            // showSearch(
                            //   context: context,
                            //   delegate: ObservationSuggestions(updateTextField)
                            //   );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Diagnosis",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 150,
                      controller: diagnosisController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counter: SizedBox.shrink(),
                          contentPadding: EdgeInsets.symmetric(
                           horizontal: 8.0,
                          ),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {
                            // showSearch(
                            //   context: context,
                            //   delegate: ObservationSuggestions(updateTextField)
                            //   );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Notes",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(8.0), // Circular corners
                ),
                child: TextField(
                  controller: notesController,
                  decoration: const InputDecoration(
                    //labelText: labelText,
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.symmetric(
                     
                      horizontal: 8.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: appColor),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                  ),
                  onPressed: () {
                    //save function
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
