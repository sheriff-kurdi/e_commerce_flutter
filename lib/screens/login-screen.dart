import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSuccessLogin = false;

  @override
  Widget build(BuildContext context) {

    TextEditingController userNameController =  TextEditingController();
    TextEditingController passwordController =  TextEditingController();
    AuthService authService = AuthService();


    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Visibility(
              child: const Text("Failed Login"),
              visible: !isSuccessLogin,
            ),
            Visibility(
              child: const Text("Login Succeed"),
              visible: isSuccessLogin,
            ),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'User Name',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: const Text("Login"),
              onPressed:() async {
                isSuccessLogin = await authService.login(userNameController.text, passwordController.text);
                setState(()  {
                  isSuccessLogin = isSuccessLogin;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
