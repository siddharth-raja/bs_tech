class Doctor {
  final String name;
  final String designation;
  final String timing;

  Doctor({required this.name, required this.designation, required this.timing});
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      designation: json['designation'],
      timing: json['timing']
    );
  }
}
