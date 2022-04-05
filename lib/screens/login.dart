import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSuccessLogin = false;

  @override
  Widget build(BuildContext context) {

    TextEditingController userNameController =  TextEditingController();
    TextEditingController passwordController =  TextEditingController();
    AuthService authService = AuthService();


    return  Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Visibility(
            child: const Text("Failed Login"),
            visible: !isSuccessLogin,

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
          ElevatedButton(
            child: const Text("Login"),
            onPressed:() async {
              isSuccessLogin = await authService.login(userNameController.text, passwordController.text);

              setState(()  {
                isSuccessLogin = isSuccessLogin;
                print("login ${isSuccessLogin}" );
              });
            },
          )
        ],
      ),
    );
  }
}
