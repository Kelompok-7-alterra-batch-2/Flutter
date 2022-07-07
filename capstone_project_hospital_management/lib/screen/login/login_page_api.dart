import 'package:capstone_project_hospital_management/screen/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/screen/splash/splash_screen.dart';
import 'package:capstone_project_hospital_management/services/API/auth/cubit/auth_cubit.dart';
import 'package:capstone_project_hospital_management/services/API/auth/model/login_request.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageApi extends StatefulWidget {
  const LoginPageApi({Key? key}) : super(key: key);

  @override
  State<LoginPageApi> createState() => _LoginPageApiState();
}

class _LoginPageApiState extends State<LoginPageApi> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  String _userEmail = '';
  String _password = '';

  bool _isObscure = true;

  late SharedPreferences pref;
  late bool isLogin;
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  void _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    // if (isValid == true) {
    //   debugPrint('Everything looks good!');
    //   debugPrint(_userEmail);
    //   debugPrint(_password);

    pref.setBool("isLogin", true);

    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) {
    //   return const DashboardPage();
    // }));
    // }
  }

  void checkLogin() async {
    pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('isLogin') ?? false;

    if (isLogin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    checkLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool emailValid = false;
    bool passValid = false;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.errorMessage.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"))
                ],
              ),
            );
          } else if (state is AuthLoading) {
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     title: const Text("Loading..."),
            //     content: Container(
            //       padding: EdgeInsets.all(60.0),
            //       height: 200,
            //       width: 200,
            //       child: CircularProgressIndicator(),
            //     ),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           child: const Text("cancel"))
            //     ],
            //   ),
            // );
            debugPrint("Loading...");
          } else if (state is AuthSuccess) {
            if (state.dataLogin.message == "Success") {
              _trySubmitForm();
              debugPrint("Berhasil Login");
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const DashboardPage();
              }));
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Warning"),
                  content: Text("User not found!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"))
                  ],
                ),
              );
              debugPrint("Data Tidak Sama");
            }
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  color: sett.cPrimary,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07,
                    vertical: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width > 770
                                ? MediaQuery.of(context).size.height * 0.08
                                : MediaQuery.of(context).size.height * 0.05,
                            horizontal: MediaQuery.of(context).size.width > 770
                                ? MediaQuery.of(context).size.width * 0.14
                                : MediaQuery.of(context).size.width * 0.06),
                        height: MediaQuery.of(context).size.width > 770
                            ? MediaQuery.of(context).size.height * 0.65
                            : MediaQuery.of(context).size.height * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image(
                                    height:
                                        (MediaQuery.of(context).size.height *
                                            0.2),
                                    image: const AssetImage(
                                        "assets/logo/logo_text_color.png"),
                                  ),
                                ),
                                //email
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Email",
                                    // style: TextStyle(
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                    style: sett.body3,
                                  ),
                                ),
                                Semantics(
                                  label: "emailId",
                                  child: TextFormField(
                                    controller: usernameC,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      // Check if the entered email has the right format
                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      emailValid = true;
                                      // Return null if the entered email is valid
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'email@carehospital.com',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onChanged: (value) => _userEmail = value,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                //password
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Password",
                                    style: sett.body3,
                                  ),
                                ),
                                Semantics(
                                  label: "passwordId",
                                  child: TextFormField(
                                    controller: passwordC,
                                    obscureText: _isObscure,
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.trim().length < 8) {
                                        return 'Password must be at least 8 characters in length';
                                      } else {
                                        if (!regex.hasMatch(value)) {
                                          return 'Please enter valid password!';
                                        }
                                      }
                                      // Return null if the entered password is valid
                                      passValid = true;
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'your password',
                                      suffixIcon: IconButton(
                                        icon: !_isObscure
                                            ? const Iconify(
                                                Iconoir.eye_alt,
                                                color: Colors.grey,
                                              )
                                            : const Iconify(
                                                Iconoir.eye_close,
                                                color: Colors.grey,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.red),
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
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const MyApp();
                                        }));
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  alignment: Alignment.center,
                                  child: (state is AuthLoading)
                                      ? const _loginButtonLoading()
                                      : SigninButton(
                                          formKey: _formKey,
                                          usernameC: usernameC,
                                          passwordC: passwordC),
                                ),
                              ],
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
        },
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  const SigninButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.usernameC,
    required this.passwordC,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernameC;
  final TextEditingController passwordC;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final bool? isValid = _formKey.currentState?.validate();
        if (isValid == true) {
//                                         _trySubmitForm();
// // pake Cubit
          final _requestData = LoginRequest(
            email: usernameC.text,
            password: passwordC.text,
          );
          context.read<AuthCubit>().signInUser(_requestData);
// end

        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        primary: sett.cPrimary,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      child: Text(
        'Sign In',
        style: sett.body3,
      ),
    );
  }
}

// ignore: camel_case_types
class _loginButtonLoading extends StatelessWidget {
  const _loginButtonLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        primary: sett.cPrimary,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      child: CircularProgressIndicator(),
    );
  }
}
