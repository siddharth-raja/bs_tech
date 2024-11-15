import 'package:bs_teknology/views/signinpage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/startpage.png'),
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20,),
            const Text('Book Appointment', style: TextStyle(fontSize: 35, color: Color.fromRGBO(113, 114, 222, 1), fontWeight: FontWeight.bold)),
            const Text("Book Doctor's Appointment For", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),),
            const Text("the patients", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignIn()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(113, 114, 222, 1),
                  borderRadius: BorderRadius.all(Radius.circular(6))
                ),
                child: const Center(child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}