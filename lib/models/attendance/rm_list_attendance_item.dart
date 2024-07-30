class RmListAttendanceItem {
  final int routePlanId;
  final String staffName;
  final String punchOutDate;
  final int staffId;
  final String punchInDeviceTime;
  final String staffDesignation;
  final String punchInDate;
  final String punchOutDeviceTime;
  final String selfieUrl;
  final String remarks;

  RmListAttendanceItem({
    required this.routePlanId,
    required this.staffName,
    required this.punchOutDate,
    required this.staffId,
    required this.punchInDeviceTime,
    required this.staffDesignation,
    required this.punchInDate,
    required this.punchOutDeviceTime,
    required this.selfieUrl,
    required this.remarks,
  });

  factory RmListAttendanceItem.fromMap(Map<String, dynamic> json) {
    return RmListAttendanceItem(
      routePlanId: json['route_plan_id'],
      staffName: json['staff_name'],
      punchOutDate: json['punch_out_date'],
      staffId: json['staff_id'],
      punchInDeviceTime: json['punch_in_device_time'],
      staffDesignation: json['staff_designation'],
      punchInDate: json['punch_in_date'],
      punchOutDeviceTime: json['punch_out_device_time'],
      selfieUrl: json['selfie_url'] ?? "",
      remarks: json['remarks'] ?? "",
    );
  }
}

class LocationItem {
  final String address;
  final String createdOn;
  final double latitude;
  final String platform;
  final double longitude;

  LocationItem({
    required this.address,
    required this.createdOn,
    required this.latitude,
    required this.platform,
    required this.longitude,
  });

  factory LocationItem.fromMap(Map<String, dynamic> json) {
    return LocationItem(
      address: json['address'],
      createdOn: json['created_on'],
      latitude: json['latitude'],
      platform: json['platform'],
      longitude: json['longitude'],
    );
  }
}
