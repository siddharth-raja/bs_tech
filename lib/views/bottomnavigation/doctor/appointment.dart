import 'package:bs_teknology/views/bottomnavigation/bottomnavigation.dart';
import 'package:bs_teknology/views/bottomnavigation/doctor/datepicker.dart';
import 'package:flutter/material.dart';
import 'timeslotselect.dart';

class Appointment extends StatefulWidget {
  final String name;
  final String designation;
  const Appointment({super.key, required this.name, required this.designation});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool isselected = false;
  bool isselected2 = false;
  String formtime = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: Column(
        children: [
          Container(
            height: 70,
            color: const Color.fromRGBO(113, 114, 222, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Appointment',
                    style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage('assets/logo.png'),
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.name, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                        Text(widget.designation, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),)
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 15,),
                HorizontalDatePicker(
                  startDate: DateTime.now(),
                  onDateSelected: (date) {
                    setState(() {
                    });
                  },
                ),
                const SizedBox(height: 15,),
                TimeSlotSelector(
                  timeSlots: const ["7 AM", "8 AM", "9 AM", "10 AM", "11 AM"],
                  onTimeSelected: (time) {
                    setState(() {
                      formtime = time;
                    });
                  },
                ),
                const SizedBox(height: 15,),
                const Text('Patient',style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),),
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
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Enter the Mobile Number', 
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey)
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 100,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: const BoxDecoration(
                              border: Border(right: BorderSide(color: Colors.grey))
                            ),
                            child: const Center(child: Text('MRD23', style: TextStyle(color: Colors.grey),)),
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  const Text('John Smith', style: TextStyle(color: Colors.grey),),
                                  const SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isselected = !isselected;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: isselected ? Colors.green : Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(isselected ? 'Selected' : 'Not Selected', style: const TextStyle(color: Colors.white))
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(color: Colors.grey, height: 0, thickness: 0.5,),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: const BoxDecoration(
                              border: Border(right: BorderSide(color: Colors.grey))
                            ),
                            child: const Center(child: Text('MRD23', style: TextStyle(color: Colors.grey),)),
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  const Text('Willum', style: TextStyle(color: Colors.grey),),
                                  const SizedBox(width: 40,),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isselected2 = !isselected2;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: isselected2 ? Colors.green : Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(isselected2 ? 'Selected' : 'Not Selected', style: const TextStyle(color: Colors.white))
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    if(formtime == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Time not selected')), behavior: SnackBarBehavior.floating, duration: Duration(seconds: 2),));
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Bottomnavigation(index: 0,)));
                    }
                  },
                  child: Container(
                    height: 70,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.purple
                    ),
                    child: const Center(
                      child: Text('Book Appointment', style: TextStyle(color: Colors.white),)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}