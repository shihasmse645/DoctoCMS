import 'package:doctocms/AppModels/patientsModel.dart';
import 'package:doctocms/constants/colors.dart';
import 'package:doctocms/controller/PatientDetailController.dart';
import 'package:doctocms/controller/patientController.dart';
import 'package:doctocms/screens/Add%20Screens/AddPatients.dart';
import 'package:doctocms/screens/patientDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientListScreen extends StatefulWidget {
  final String? patientId;
  final String clinicId;
  final String userId;

  PatientListScreen(
      {this.patientId, required this.clinicId, required this.userId});

  @override
  State<PatientListScreen> createState() =>
      _PatientListScreenState(clinicId: clinicId, userId: userId);
}

class _PatientListScreenState extends State<PatientListScreen> {
  String? patientId;
  String clinicId, userId;

  _PatientListScreenState(
      {this.patientId, required this.clinicId, required this.userId});

  final patientController = Get.put(PatientController());
  final patientdetails = Get.put(PatientDetailController());


  bool _isSearching = false;
  late TextEditingController _searchQueryController = TextEditingController();

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      _searchQueryController.clear();
    });
  }

  final String? doctorname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        title: _isSearching
            ? _buildSearchField()
            : const Text(
                'doctosmart',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
        //title: const Text('dosctosmart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: _buildAppBarActions(),

        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       // Handle search button press
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.add),
        //     onPressed: () {
        //       // Handle add button press
        //     },
        //   ),
        // ],
        toolbarHeight: 120,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0), // Adjust the height as needed
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                'PATIENTS', // Text widget at the bottom center
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                FutureBuilder<Map<String, dynamic>>(
                  future: patientController.patient(clinicId, userId),
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Oops no network'),
                        );
                      } else {
                        Map<String, dynamic>? profileData = snapshot.data;
                        PatientModel user = profileData!['user'];

                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: user.result!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              // onLongPress: () {
                              //   showDeleteDialog(context, user, index);

                              // },
                              // () => showDeleteDialog(context, user, index),
                              leading: CircleAvatar(
                                  foregroundColor: Colors.cyan,
                                  backgroundColor: Colors.white,
                                  backgroundImage: user.result![index]
                                          .profilePicture!.isNotEmpty
                                      ? NetworkImage(user
                                          .result![index].profilePicture
                                          .toString())
                                      : NetworkImage(
                                          'https://toppng.com/uploads/preview/blue-person-icon-blue-person-icon-115629039821nthr4gtiu.png')

                                  // Text(
                                  //   user.result![index].patientName![0]
                                  //       .toUpperCase(),
                                  // ),
                                  ),
                              title: Text(
                                user.result![index].patientName!.toString(),
                              ),
                              subtitle: Text(
                                user.result![index].mobileNo!.toString(),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PatientDetailScreen(
                                            id: user.result![index].id.toString(),
                                            userId: userId,
                                            clinicId: clinicId, 
                                            patientName: user.result![index].patientName!.toString(),
                                          ),
                                    ));
                              
                              },
                            );
                          },
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search here',
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      onChanged: (value) {
        // Perform search operation based on the entered value
        print(value);
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _searchQueryController.clear();
          },
        ),
      ];
    } else {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _startSearch,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPatient(
                  clinicId: clinicId,
                  userId: userId,
                ),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ];
    }
  }
}
