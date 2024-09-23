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

class VisitTrackingDetailItem {
  final int routePlanId;
  final String date;
  final int visitCount;
  final double travelledKm;
  final String punchedOut;
  final String punchedIn;

  VisitTrackingDetailItem({
    required this.routePlanId,
    required this.date,
    required this.visitCount,
    required this.travelledKm,
    required this.punchedOut,
    required this.punchedIn,
  });

  factory VisitTrackingDetailItem.fromMap(Map<String, dynamic> json) {
    return VisitTrackingDetailItem(
      routePlanId: json['route_plan_id'],
      date: json['date'],
      visitCount: json['visit_count'],
      travelledKm: json['travelled_km'],
      punchedOut: json['punched_out'],
      punchedIn: json['punched_in'],
    );
  }
}
