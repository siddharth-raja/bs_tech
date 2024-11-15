import 'package:bs_teknology/views/bottomnavigation/bottomnavigation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.4,
              child: const Image(
                image: AssetImage('assets/signinpage.png'),
                fit: BoxFit.fill,
              ),
            ),
            const Text("Sign in to Book a doctor's", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
            const Text("appointment", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: size.width * 0.9,
              child:  TextField(
                controller: email,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 228, 228),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  labelText: "Enter the Email",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.normal)
                )
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: size.width * 0.9,
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 228, 228),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  labelText: "Enter the Password",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.normal)
                )
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                if(email.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Please enter an email address')), behavior: SnackBarBehavior.floating, duration: Duration(seconds: 2),));
                } else if(password.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Please enter password')), behavior: SnackBarBehavior.floating, duration: Duration(seconds: 2),));
                } else {
                  String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(email.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Enter valid email address')), behavior: SnackBarBehavior.floating, duration: Duration(seconds: 2),));
                  }else {
                    email.text = "";
                    password.text = "";
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Bottomnavigation(index: 0,)));
                  }
                }
              },
              child: Container(
                height: 50,
                width: size.width * 0.9,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(113, 114, 222, 1),
                  borderRadius: BorderRadius.all(Radius.circular(6))
                ),
                child: const Center(child: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?', style: TextStyle(fontSize: 18,)),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Design not given :(')), behavior: SnackBarBehavior.floating, duration: Duration(seconds: 2),));
                  },
                  child: const Text('Sign Up', style: TextStyle(fontSize: 18),),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}