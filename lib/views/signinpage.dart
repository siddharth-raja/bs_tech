import 'package:bs_teknology/views/home/dashboard.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: Column(
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Dashboard()));
                }
              }
            },
            child: Container(
              height: 50,
              width: size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.purple,
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
    );
  }
}