class DateRangeFilter {
  DateTime from;
  DateTime to;

  DateRangeFilter({
    required this.from,
    required this.to,
  });

  factory DateRangeFilter.currentMonth() {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1);
    final lastDay = DateTime(now.year, now.month + 1, 0);
    return DateRangeFilter(
      from: firstDay,
      to: lastDay,
    );
  }

  factory DateRangeFilter.fromMap(Map<String, dynamic> json) {
    return DateRangeFilter(
      from: DateTime.parse(json['from_date']),
      to: DateTime.parse(json['to_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "from_date": from.toIso8601String(),
      "to_date": to.toIso8601String(),
    };
  }
}
