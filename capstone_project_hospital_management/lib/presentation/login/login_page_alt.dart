import 'package:capstone_project_hospital_management/presentation/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class LoginPageAlt extends StatefulWidget {
  const LoginPageAlt({Key? key}) : super(key: key);

  @override
  State<LoginPageAlt> createState() => _LoginPageAltState();
}

class _LoginPageAltState extends State<LoginPageAlt> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  bool _isObscure = true;

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);

      debugPrint(_password);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const DashboardPage();
      }));
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff4e89a8),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image(
                          height: MediaQuery.of(context).size.height * 0.2,
                          image: const AssetImage(
                              "assets/logo/logo_text_color.png"),
                        ),
                      ),
                      //email
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Semantics(
                        label: "emailId",
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter';
                            }
                            // Check if the entered email has the right format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'email@carehospital.com',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) => _userEmail = value,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      //password
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Semantics(
                        label: "passwordId",
                        child: TextFormField(
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter';
                            }
                            if (value.trim().length < 8) {
                              return 'Password must be at least 8 characters in length';
                            }
                            // Return null if the entered password is valid
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) => _password = value,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              "Forgot Password",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const MyApp();
                              }));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: _trySubmitForm,
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff4e89a8),
                                fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w700),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
