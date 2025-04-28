import 'package:flutter/material.dart';
import 'package:habit_tracker/authentication/signup_page.dart';
import 'package:habit_tracker/models/login_model.dart';
import 'package:habit_tracker/services/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(
    text: "user@example.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "securepassword123",
  );
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      final resp = await ApiService().loginPost(
        LoginModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      // emailController.text = resp['token'].toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(resp['token'].toString()),
          );
        },
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    label: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(255, 92, 0, 1),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color.fromRGBO(255, 92, 0, 1),
                    ),
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ).copyWith(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 24,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          letterSpacing: 0,
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(210, 210, 210, 1),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          letterSpacing: 0,
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(210, 210, 210, 1),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 40, 60),
              child: TextButton(
                onPressed: login,
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 92, 0, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.all(0),
                  minimumSize: Size.fromHeight(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? CircularProgressIndicator(
                          color: Colors.white,
                          constraints: BoxConstraints(
                            minHeight: 20,
                            minWidth: 20,
                          ),
                        )
                        : Text(
                          "Log In",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                spacing: 10,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Or log in with:"),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset("assets/images/google.png")],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
