import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tiktok Clone',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: buttonColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _emailController,
              icon: Icons.email,
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _passwordController,
              icon: Icons.lock,
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () {
                print('login');
              },
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an Account ? ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  print('registering');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
