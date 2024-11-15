import 'package:bs_teknology/models/doctormodel.dart';

class DoctorController {
  Future<List<Doctor>> fetchDoctorList() async {
    List<dynamic> data = [
      {
        "id":1,
        "name": 'John',
        "designation": "Heart Specialist",
        "timing": "7am - 8pm",
      },
      {
        "id":2,
        "name": 'Jane',
        "designation": "Neurologist",
        "timing": "8am - 9pm"
      },
      {
        "id":3,
        "name": 'Alice',
        "designation": "Dermatologist",
        "timing": "9am - 10pm"
      },
      {
        "id":4,
        "name": 'Bob',
        "designation": "Orthopedic Surgeon",
        "timing": "10am - 11pm"
      },
      {
        "id":5,
        "name": 'Sarah',
        "designation": "Pediatrician",
        "timing": "11am - 11pm"
      },
      {
        "id":6,
        "name": 'David',
        "designation": "Cardiologist",
        "timing": "12pm - 10pm"
      },
      {
        "id":7,
        "name": 'Eva',
        "designation": "General Physician",
        "timing": "10am - 11pm"
      }
    ];

    return data.map((userJson) => Doctor.fromJson(userJson)).toList();
  }
}
