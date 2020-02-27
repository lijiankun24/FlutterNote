class RandomUserModel {
  List<UserDetail> results;
  PageInfo info;
}

class UserDetail {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;
}

class Location {
  Street street;
  String city;
  String state;
  String country;
  int postcode;
  Coordinates coordinates;
  Timezone timezone;
}

class Name {
  String title;
  String first;
  String last;
}

class Street {
  int number;
  String name;
}

class Coordinates {
  String latitude;
  String longitude;
}

class Timezone {
  String offset;
  String description;
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
}

class Dob {
  String date;
  int age;
}

class Registered {
  String date;
  int age;
}

class Id {
  String name;
  String value;
}

class Picture {
  String large;
  String medium;
  String thumbnail;
}

class PageInfo {
  String seed;
  int results;
  int page;
  String version;
}
