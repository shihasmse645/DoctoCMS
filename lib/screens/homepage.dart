import 'package:doctocms/screens/login.dart';
import 'package:doctocms/screens/patientList.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../widgets/squareWidget.dart';
import 'AppointmentList.dart';
import 'Docterlist.dart';

class Homepage extends StatefulWidget {

final String clinicId;
  final String userId;

  const Homepage({
    required this.clinicId,
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear the user's login status and any related data
    await prefs.remove('isLoggedIn');
    await prefs.remove('userToken'); // Adjust this based on your actual data

    // Navigate back to the login screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        leading: Image.asset("assets/Images/Logo.png", fit: BoxFit.contain),
        title: const Text("doctosmart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              logout();
              //logout function
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "VM Dental Clinics",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction:
                                0.8, // Adjust the fraction as needed
                            enlargeCenterPage:
                                true, // Optionally enlarge the centered item

                            autoPlayInterval: const Duration(seconds: 2),
                            scrollDirection: Axis.horizontal,
                          ),
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/Images/carousel.jpg',
                                fit: BoxFit.cover,
                                // width: MediaQuery.of(context).size.width, // Full-width carousel
                                // height: MediaQuery.of(context).size.height * 0.6, // 60% of screen height
                              ),
                            ),
                            // Add more carousel items here
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PatientListScreen(clinicId: widget.clinicId , userId: widget.userId,)));
                                },
                                child: CustomSquareWidget(
                                  categoryName: "Patients",
                                  number: 22,
                                  icon: Icons.add,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentList()));
                              },
                              child: CustomSquareWidget(
                                categoryName: "Appointments",
                                number: 0,
                                icon: Icons.add,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorList()));
                              },
                              child: CustomSquareWidget(
                                categoryName: "Doctor",
                                number: 8,
                                icon: Icons.add,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                color: appColor,
              ),
              height: 50,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
