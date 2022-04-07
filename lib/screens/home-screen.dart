import 'package:e_commerce/screens/login-screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:  Center(
        child: ElevatedButton(
          child: const Text("login"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),

      ),
    );
  }
}
