class VisitTrackingItem {
  final String staffName;
  final double travelledKm;
  final int staffId;
  final String staffDesignation;

  VisitTrackingItem({
    required this.staffName,
    required this.travelledKm,
    required this.staffId,
    required this.staffDesignation,
  });

  factory VisitTrackingItem.fromMap(Map<String, dynamic> json) {
    return VisitTrackingItem(
      staffName: json['staff_name'],
      travelledKm: json['travelled_km'],
      staffId: json['staff_id'],
      staffDesignation: json['staff_designation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "staff_name": staffName,
      "travelled_km": travelledKm,
      "staff_id": staffId,
      "staff_designation": staffDesignation,
    };
  }
}
