import 'dart:io';

import 'package:doctocms/constants/colors.dart';
import 'package:doctocms/controller/AddPetientController.dart';
import 'package:doctocms/screens/patientList.dart';
import 'package:doctocms/widgets/genderChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddPatient extends StatefulWidget {
  final String clinicId;
  final String userId;

  const AddPatient({super.key, required this.clinicId, required this.userId});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? patientName, registrationId, mobileNo;
  String email = "", address = "", age = "";
  String dateOfBirth = "";
  // int selectedGenderIndex = 0;
  List<String> genders = ['M', 'F'];
  String gender = "";
  late String cmsc;
  late String type;
  final _formKey = GlobalKey<FormState>();

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  final patientInfo = Get.put(AddPatientController());

  void selectMale() {
    setState(() {
      isMaleSelected = true;
      isFemaleSelected = false;
      gender = 'M';
      print(gender);
    });
  }

  void selectFemale() {
    setState(() {
      isMaleSelected = false;
      isFemaleSelected = true;
      gender = 'F';
      print(gender);

    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
        dateOfBirth =
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      });
    }
  }

// Image Sources

  File? profilePicture;
  _imgFromCamera() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      profilePicture = File(image!.path);
    });
  }

  var image;

  _imgFromGallery() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      profilePicture = File(image!.path);
    });
  }

  void _showPickers(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: const Color.fromRGBO(238, 255, 249, 2),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(
                          Icons.photo_library,
                          color: Color.fromRGBO(0, 191, 225, 1),
                        ),
                        title: const Text('File',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(66, 78, 98, 2),
                              letterSpacing: 1,
                              fontFamily: "QuicksandRegular",
                            )),
                        onTap: () {
                          setState(() {
                            //       imageSelectPic();
                          });

                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: const Icon(
                        Icons.photo_camera,
                        color: Color.fromRGBO(0, 191, 225, 1),
                      ),
                      title: const Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(66, 78, 98, 2),
                          letterSpacing: 1,
                          fontFamily: "QuicksandRegular",
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Patients",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500, color: appColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showPickers(context);
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: const Color.fromRGBO(0, 191, 225, 0.5),
                            child: profilePicture != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      profilePicture!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(238, 255, 249, 2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: const Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Color.fromRGBO(0, 191, 225, 1),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Name",
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
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Please enter Name" : null,
                    controller: nameController,
                    onSaved: (value) => patientName = value,
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
                  height: 10,
                ),
                const Text(
                  "Mobile No",
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
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Please enter Mobile number" : null,
                    controller: mobileNoController,
                    onSaved: (value) => mobileNo = value,
                    keyboardType: TextInputType.number,
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
                  height: 10,
                ),
                const Text(
                  "Age",
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
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "This Field is Mandatory" : null,
                    controller: ageController,
                    onSaved: (value) => age = value!,
                    keyboardType: TextInputType.number,
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
                  height: 10,
                ),
                const Text(
                  "Email",
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
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "This Field is Mandatory" : null,
                    controller: emailController,
                    onSaved: (value) => email = value!,
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
                  height: 10,
                ),
                const Text(
                  "Address",
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
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "This Field is Mandatory" : null,
                    controller: addressController,
                    onSaved: (value) => address = value!,
                    keyboardType: TextInputType.streetAddress,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "DOB",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          dateOfBirth,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    const Spacer(
                      flex: 2, // <-- SEE HERE
                    ),
                    MultiSelectChip(genders, onSelectionChanged: (selectedList){
                      setState(() {
                        gender = selectedList;
                        print(gender);
                        onSaved:
                        (value) => cmsc = gender.toString();
                        obscureText:
                        false;
                        validator:
                        (value) => value.isEmpty
                            ? "Please select gender"
                            : null;
                        decoration:
                        InputDecoration(
                          filled: true,
                          // fillColor: Color.fromRGBO(39,150,226, 0.8),
                          //hintText: 'University',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
          
                          contentPadding: const EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                        );
                      });
                      
                    })
                  
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //signIn();
                    if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final Future<Map<String, dynamic>>
                                  successfulMessage = patientInfo.addPatient(
                                      profilePicture!,
                                      patientName!,
                                      mobileNo!,
                                      age,
                                      email,
                                      address,
                                      dateOfBirth,
                                      gender,
                                      widget.userId,
                                      widget.clinicId);
          
                              successfulMessage.then((response) {
                                print("response :" + response.toString());
          
                                if (response['status']) {
                                  print(response);
          
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PatientListScreen(
                                              clinicId: widget.clinicId,
                                              userId: widget.userId,
                                            )),
                                  );
                                };
                              });
                            }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: appColor, borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
