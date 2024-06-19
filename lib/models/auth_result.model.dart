class AuthResult {
  final int loginId;
  final int userId;
  final String userName;
  final String activeStatus;
  final UserType userType;
  final String token;

  AuthResult({
    required this.loginId,
    required this.userId,
    required this.userName,
    required this.userType,
    required this.activeStatus,
    required this.token,
  });

  factory AuthResult.guest() {
    return AuthResult.fromMap({
      "login_id": 0,
      "user_id": 0,
      "name": "Guest",
      "user_name": "Guest",
      "user_type": {"id": 0, "name": "Guest"},
      "active_status": "",
      "token": "",
    });
  }

  factory AuthResult.fromMap(Map<String, dynamic> map) {
    return AuthResult(
      loginId: int.parse("${map['login_id']}"),
      userId: int.parse("${map['user_id']}"),
      userName: map['user_name'],
      userType: UserType.fromMap(map['user_type']),
      activeStatus: map['active_status'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login_id': loginId,
      'user_id': userId,
      'user_name': userName,
      'user_type': userType.toMap(),
      'active_status': activeStatus,
      'token': token,
    };
  }

  AuthResult copyWith({
    int? loginId,
    int? userId,
    String? name,
    String? userName,
    String? activeStatus,
    String? token,
    UserType? userType,
  }) {
    return AuthResult(
      loginId: loginId ?? this.loginId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userType: userType ?? this.userType,
      activeStatus: activeStatus ?? this.activeStatus,
      token: token ?? this.token,
    );
  }
}

class UserType {
  final int id;
  final String name;

  const UserType({
    required this.id,
    required this.name,
  });

  factory UserType.fromMap(Map<String, dynamic> map) {
    return UserType(
      id: int.parse("${map["id"]}"),
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
    };
  }
}
