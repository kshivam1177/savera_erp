class DxState {
  int stateId = 0;
  String stateFullName = "";
  String stateCode = "";
  List<District> districts = [];

  DxState({
    required this.stateId,
    required this.stateFullName,
    required this.stateCode,
    this.districts = const [],
  });
}

class City {
  int cityId = 0;
  String cityName = "";
  String zipCode = "";

  City({
    required this.cityId,
    required this.cityName,
    required this.zipCode,
  });
}

class District {
  int districtId = 0;
  String districtName = "";
  List<City> cities = [];

  District({
    required this.districtId,
    required this.districtName,
    this.cities = const [],
  });
}
