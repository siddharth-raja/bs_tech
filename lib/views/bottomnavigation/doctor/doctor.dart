import 'package:bs_teknology/views/bottomnavigation/doctor/appointment.dart';
import 'package:flutter/material.dart';
import '../../../controllers/doctorcontroller.dart';
import '../../../models/doctormodel.dart';

class Doctorlist extends StatefulWidget {
  const Doctorlist({super.key});

  @override
  State<Doctorlist> createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  List<Doctor> doctors = [];
  List<Doctor> filteredDoctors = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  String truncateString(String text, int maxLength) {
    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}..';
    }
    return text;
  }

  void fetchDoctors() async {
    final fetchedDoctors = await DoctorController().fetchDoctorList();
    setState(() {
      doctors = fetchedDoctors;
      filteredDoctors = fetchedDoctors;
    });
  }

  void filterDoctors(String query) {
    setState(() {
      searchQuery = query;
      filteredDoctors = doctors
          .where((doctor) => doctor.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
                  'Doctor List',
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              onChanged: filterDoctors,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Search Doctor..',
                contentPadding: EdgeInsets.only(left: 10),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ),
        Expanded(
          child: filteredDoctors.isEmpty
              ? const Center(child: Text('No doctors available'))
              : Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = filteredDoctors[index];
                        return Column(
                          children: [
                            Container(
                              height: 110,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          doctor.name,
                                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => Appointment(name: doctor.name, designation: doctor.designation,)));
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 205, 84, 75),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Book Appointment',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          truncateString(doctor.designation, 13),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 30,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 218, 207, 104),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text(
                                              doctor.timing,
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
