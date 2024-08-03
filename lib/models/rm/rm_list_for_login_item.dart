class RmListLoginItem {
  final int staffId;
  final String staffName;
  final String staffLocation;
  final String staffDesignation;
  final String joinDate;
  final String staffPhone;
  final int userTypeId;
  final String userTypeName;
  final String loginUserName;
  final String loginDeviceInfo;
  final String loginInactiveOn;
  final String loginDeletedOn;
  final String lastLoginDate;
  final String loginCreatedOn;

  RmListLoginItem({
    required this.staffId,
    required this.staffName,
    required this.staffLocation,
    required this.staffDesignation,
    required this.joinDate,
    required this.staffPhone,
    required this.userTypeId,
    required this.userTypeName,
    required this.loginUserName,
    required this.loginDeviceInfo,
    required this.loginInactiveOn,
    required this.loginDeletedOn,
    required this.lastLoginDate,
    required this.loginCreatedOn,
  });

  factory RmListLoginItem.fromMap(Map<String, dynamic> json) {
    return RmListLoginItem(
      staffId: json['staff_id'],
      staffName: json['staff_name'],
      staffLocation: json['staff_location'],
      staffDesignation: json['staff_designation'],
      joinDate: json['join_date'],
      staffPhone: json['staff_phone'],
      userTypeId: json['user_type_id'],
      userTypeName: json['user_type_name'],
      loginUserName: json['login_user_name'] ?? "",
      loginDeviceInfo: json['login_device_info'] ?? "",
      loginInactiveOn: json['login_inactive_on'] ?? "",
      loginDeletedOn: json['login_deleted_on'] ?? "",
      lastLoginDate: json['last_login_date'] ?? "",
      loginCreatedOn: json['login_created_on'] ?? "",
    );
  }
}
