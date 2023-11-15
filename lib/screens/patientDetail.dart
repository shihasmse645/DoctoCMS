import 'package:doctocms/screens/Add%20Screens/AddAppointment.dart';
import 'package:doctocms/widgets/PaymentCard.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/AppointmentCard.dart';
import '../widgets/PriscriptionCard.dart';
import '../widgets/TreatmentplanCard.dart';
import '../widgets/clinicalnote.dart';
import 'Add Screens/AddClinicNote.dart';
import 'Add Screens/Addtreatment.dart';

class PatientDetailScreen extends StatefulWidget {
  //final Patient patient;
  final String id;
  final String userId;
  final String clinicId;
  final String patientName;

  PatientDetailScreen({
    required this.id,
    required this.userId,
    required this.clinicId,
    required this.patientName,
  });

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 8,
          backgroundColor: appColor,
          title: Text(widget.patientName),
          //title: Text(widget.patient.name),
          bottom: TabBar(
              isScrollable: true,
              //indicator: null,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 2.0),
                //color:Colors.white
              ),
              tabs: const [
                Tab(
                  child: Text("Appointments"),
                ),
                Tab(
                  child: Text("Clinical Notes"),
                ),
                Tab(
                  child: Text("Treatement"),
                ),
                Tab(
                  child: Text("Prescription"),
                ),
                Tab(
                  child: Text("Payment"),
                ),
                Tab(
                  child: Text("Attachment"),
                ),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: TabBarView(
            children: [
              // Appointments tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAppointment()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Appointment"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Appointment",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const appointmentCard()
                ],
              ),
              // Clinical Notes tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddClinicNote()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Clinic Note"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Clinic Notes",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ClinicalNotesCard()
                ],
              ),

              // Treatment tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTreatment()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Treatment"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Treatment Plan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TreatmentCard()
                ],
              ),

              // Prescription tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Priscription"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Priscriptions",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PriscriptionCard()
                ],
              ),

              // Payment tab content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Payment"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Payment",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PaymentCard()
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      child: const Text("Add Attachment"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Attachments",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: appColor),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Attachment Not Found",
                        style: TextStyle(color: appColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
