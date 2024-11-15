class Doctor {
  final String name;
  final String designation;
  final String timing;
  final int id;

  Doctor({required this.name, required this.designation, required this.timing, required this.id});
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      designation: json['designation'],
      timing: json['timing'],
    );
  }
}
