import 'package:bs_teknology/controllers/doctorcontroller.dart';
import 'package:flutter/material.dart';

import '../../../models/doctormodel.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(113, 114, 222, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.menu, size: 30, color: Colors.white),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.cover, height: 50, width: 50,)
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text('Welcome Back', style: TextStyle(fontSize: 20, color: Colors.white70)),
                    const SizedBox(height: 5,),
                    const Text('Let\'s Book The\nAppointment', style: TextStyle(fontSize: 30, color: Colors.white)),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: const TextField(
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.search, size: 35, color: Colors.grey,)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Search Catogories..',
                          contentPadding: EdgeInsets.only(left: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: TextStyle(fontSize: 18, color: Colors.grey)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Catogories', style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 199, 22, 10), fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        icon: Icon(Icons.local_hospital, size: 50,),
                        text: "General", 
                        color: Color.fromARGB(255, 218, 207, 104),
                      ),
                      CustomButton(
                        icon: Icon(Icons.medical_information, size: 50,),
                        text: "ENT", 
                        color: Color.fromARGB(255, 80, 121, 192)
                      ),
                      CustomButton(
                        icon: Icon(Icons.earbuds, size: 50,),
                        text: "Dental", 
                        color: Colors.green
                      ),
                      CustomButton(
                        icon: Icon(Icons.favorite, size: 40, color: Colors.red,),
                        text: "Cardio", 
                        color: Color.fromARGB(255, 213, 212, 212)
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Text('Top Doctors', style: TextStyle(fontSize: 23, color: Color.fromARGB(255, 199, 22, 10), fontWeight: FontWeight.w500),),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          
                        },
                        child: const Row(
                          children: [
                            Text('All', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(width: 5,),
                            Icon(Icons.arrow_forward_ios, size: 18,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Doctor>>(
                future: DoctorController().fetchDoctorList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No doctors available'));
                  }
        
                  final doctors = snapshot.data!;
        
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          return Column(
                            children: [
                              Container(
                                height: 110,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(doctor.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          const Spacer(),
                                          Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 218, 207, 104),
                                              borderRadius: BorderRadius.circular(6)
                                            ),
                                            child: Center(child: Text(doctor.timing, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(doctor.designation, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,)
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color color;
  const CustomButton({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
            color: color
          ),
          child: icon
        ),
        const SizedBox(height: 5,),
        Text(text, style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w300),)
      ],
    );
  }
}