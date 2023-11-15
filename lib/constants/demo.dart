// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:doctocms/controller/patient_Controller.dart';
// import 'package:doctocms/model/patient_Model.dart';
// import 'package:doctocms/patients/view/add_patients.dart';
// import 'package:doctocms/patients/view/patients_details.dart';
// import 'package:doctocms/patients/view/widget/delete_dialBox.dart';

// class Patients extends StatefulWidget {
//   final String? patientId;
//   final String clinicId;
//   final String userId;

//   Patients({this.patientId, required this.clinicId, required this.userId});

//   @override
//   State<Patients> createState() =>
//       _PatientsState(clinicId: this.clinicId, userId: this.userId);
// }

// class _PatientsState extends State<Patients> {
//   String? patientId;
//   String clinicId, userId;

//   _PatientsState({this.patientId, required this.clinicId, required this.userId});

//   final patientController = Get.put(PatientController());

//   void showDeleteDialog(BuildContext context, PatientModel user, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return DeleteDialogBox(
//           patientId: user.result![index].id.toString(),
//           clinicId: clinicId,
//           userId: userId,
//         );
//       },
//     );
//   }

//   bool _isSearching = false;
//   late TextEditingController _searchQueryController = TextEditingController();

//   void _startSearch() {
//     ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
//     setState(() {
//       _isSearching = true;
//     });
//   }

//   void _stopSearching() {
//     setState(() {
//       _isSearching = false;
//       _searchQueryController.clear();
//     });
//   }

//   final String? doctorname = '';

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 20,
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.cyan,
//         title: _isSearching ? _buildSearchField() : const Text(
//           'doctosmart',
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         actions: _buildAppBarActions(),
//         bottom: PreferredSize(
//           child: Column(
//             children: [
//               Text(
//                 'PATIENTS',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//           preferredSize: Size.fromHeight(30),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: Column(
//             children: [
//               FutureBuilder<Map<String, dynamic>>(
//                 future: patientController.patient(clinicId, userId),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<Map<String, dynamic>> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasError) {
//                       return Scaffold(
//                         body: Center(
//                           child: Text('Oops no network'),
//                         ),
//                       );
//                     } else{
//                       Map<String, dynamic>? profileData = snapshot.data;
//                       PatientModel user = profileData!['user'];

//                       return ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: user.result!.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             onLongPress: () {
//                               showDeleteDialog(context, user, index);

//                             },
//                             // () => showDeleteDialog(context, user, index),
//                             leading: CircleAvatar(
//                               foregroundColor: Colors.cyan,
//                               backgroundColor: Colors.white,
//                               backgroundImage: user.result![index].profilePicture!.isNotEmpty
//                               ?  NetworkImage(user.result![index].profilePicture.toString()) 
//                               : NetworkImage('https://toppng.com/uploads/preview/blue-person-icon-blue-person-icon-115629039821nthr4gtiu.png')
                             
//                               // Text(
//                               //   user.result![index].patientName![0]
//                               //       .toUpperCase(),
//                               // ),
//                             ),
//                             title: Text(
//                               user.result![index].patientName!.toString(),
//                             ),
//                             subtitle: Text(
//                               user.result![index].mobileNo!.toString(),
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => PatientsDetails(
//                                     doctorName: doctorname!,
//                                     patientName: user
//                                         .result![index].patientName!
//                                         .toString(),
//                                         patientId: user.result![index].id.toString(),
//                                          clinicId: clinicId,userId: userId,
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     }
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }