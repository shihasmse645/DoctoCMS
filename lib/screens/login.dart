import 'package:doctocms/AppModels/loginModel.dart';
import 'package:doctocms/controller/loginController.dart';
import 'package:doctocms/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController clinicIdController = TextEditingController();

  String? username, password, clinicId;

  bool _obscurePassword = true;
  //late SharedPreferences prefs;

  void _togglePasswordVisibility() {
    // Toggle the password visibility
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  final logins = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   super.initState();
  //   initializeSharedPreferences(); // Initialize SharedPreferences
  // }

  // Future<void> initializeSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appColor,
        leading: Image.asset("assets/Images/Logo.png", fit: BoxFit.contain),
        title: const Text("doctosmart"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          " Username",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onSaved: (value) => username = value,
                        controller: usernameController,
                        validator: (value) =>
                            value!.isEmpty ? "Please enter username" : null,
                        decoration: InputDecoration(
                          //hintText: 'Username',
                          fillColor: const Color.fromRGBO(0, 191, 225, 0.5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          " Password",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextFormField(
                        obscureText: _obscurePassword,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onSaved: (value) => password = value,
                        controller: passwordController,
                        validator: (value) =>
                            value!.isEmpty ? "Please enter password" : null,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: _togglePasswordVisibility,
                            child: const Icon(Icons.visibility),
                          ),
                          //hintText: 'Username',
                          fillColor: const Color.fromRGBO(0, 191, 225, 0.5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          " Clinic ID",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onSaved: (value) => clinicId = value,
                        controller: clinicIdController,
                        validator: (value) =>
                            value!.isEmpty ? "Please enter clinic id" : null,
                        decoration: InputDecoration(
                          //hintText: 'Username',
                          fillColor: const Color.fromRGBO(0, 191, 225, 0.5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final Future<Map<String, dynamic>>
                                successfulMessage =
                                logins.login(username!, password!, clinicId!);
                            successfulMessage.then((response) async {
                              if (response['status']) {
                                // print(response);
                                LoginModel user = response['user'];
                                if (user.message == "Login Success") {
                                  // prefs.setString(
                                  //     "username", username.toString());
                                  // prefs.setString(
                                  //     "clinicId", clinicId.toString());
                                  // prefs.setString(
                                  //     "userId", user.result.userId.toString());
                                  // prefs.setBool('isLoggedIn', true);
                                  // prefs.setString('userToken',
                                  //     'ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==');
                                  // final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  // prefs.setString('username', usernameController.text);
                                  //  routeProvider.navigateTo(AppRoute.home);
                                  print(clinicId);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage(
                                              clinicId: clinicId!,
                                              userId:
                                                  user.result.userId.toString(),
                                        )),
                                  );
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  user.message,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            207, 181, 59, 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
