import 'package:bs_teknology/models/doctormodel.dart';

class DoctorController {
  Future<List<Doctor>> fetchDoctorList() async {
    List<dynamic> data = [
      {
        "name": 'John',
        "designation": "Heart Specialist",
        "timing": "7am - 8am"
      },
      {
        "name": 'Jane',
        "designation": "Neurologist",
        "timing": "8am - 9am"
      },
      {
        "name": 'Alice',
        "designation": "Dermatologist",
        "timing": "9am - 10am"
      },
      {
        "name": 'Bob',
        "designation": "Orthopedic Surgeon",
        "timing": "10am - 11am"
      },
      {
        "name": 'Sarah',
        "designation": "Pediatrician",
        "timing": "11am - 12pm"
      },
      {
        "name": 'David',
        "designation": "Cardiologist",
        "timing": "12pm - 1pm"
      },
      {
        "name": 'Eva',
        "designation": "General Physician",
        "timing": "1pm - 2pm"
      }
    ];

    return data.map((userJson) => Doctor.fromJson(userJson)).toList();
  }
}
