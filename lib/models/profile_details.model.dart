class ProfileDetail {
  final String phone;
  final String name;
  final String location;
  final String designation;

  ProfileDetail({
    required this.phone,
    required this.name,
    required this.location,
    required this.designation,
  });

  factory ProfileDetail.fromMap(Map<String, dynamic> map) {
    return ProfileDetail(
      phone: map['phone'],
      name: map['name'],
      location: map['location'],
      designation: map['designation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'name': name,
      'location': location,
      'designation': designation,
    };
  }

  ProfileDetail copyWith({
    String? phone,
    String? name,
    String? location,
    String? designation,
  }) {
    return ProfileDetail(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      location: location ?? this.location,
      designation: designation ?? this.designation,
    );
  }
}
