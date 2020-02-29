// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomUserModel _$RandomUserModelFromJson(Map<String, dynamic> json) {
  return RandomUserModel(
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : UserDetail.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['info'] == null
          ? null
          : PageInfo.fromJson(json['info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RandomUserModelToJson(RandomUserModel instance) =>
    <String, dynamic>{'results': instance.results, 'info': instance.info};

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
      json['gender'] as String,
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['email'] as String,
      json['login'] == null
          ? null
          : Login.fromJson(json['login'] as Map<String, dynamic>),
      json['dob'] == null
          ? null
          : Dob.fromJson(json['dob'] as Map<String, dynamic>),
      json['registered'] == null
          ? null
          : Registered.fromJson(json['registered'] as Map<String, dynamic>),
      json['phone'] as String,
      json['cell'] as String,
      json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      json['picture'] == null
          ? null
          : Picture.fromJson(json['picture'] as Map<String, dynamic>),
      json['nat'] as String);
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'login': instance.login,
      'dob': instance.dob,
      'registered': instance.registered,
      'phone': instance.phone,
      'cell': instance.cell,
      'id': instance.id,
      'picture': instance.picture,
      'nat': instance.nat
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      json['street'] == null
          ? null
          : Street.fromJson(json['street'] as Map<String, dynamic>),
      json['city'] as String,
      json['state'] as String,
      json['country'] as String,
      json['postcode'] as int,
      json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
      'coordinates': instance.coordinates,
      'timezone': instance.timezone
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
      json['title'] as String, json['first'] as String, json['last'] as String);
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last
    };

Street _$StreetFromJson(Map<String, dynamic> json) {
  return Street(json['number'] as int, json['name'] as String);
}

Map<String, dynamic> _$StreetToJson(Street instance) =>
    <String, dynamic>{'number': instance.number, 'name': instance.name};

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(json['latitude'] as String, json['longitude'] as String);
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };

Timezone _$TimezoneFromJson(Map<String, dynamic> json) {
  return Timezone(json['offset'] as String, json['description'] as String);
}

Map<String, dynamic> _$TimezoneToJson(Timezone instance) => <String, dynamic>{
      'offset': instance.offset,
      'description': instance.description
    };

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
      json['uuid'] as String,
      json['username'] as String,
      json['password'] as String,
      json['salt'] as String,
      json['md5'] as String,
      json['sha1'] as String,
      json['sha256'] as String);
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'password': instance.password,
      'salt': instance.salt,
      'md5': instance.md5,
      'sha1': instance.sha1,
      'sha256': instance.sha256
    };

Dob _$DobFromJson(Map<String, dynamic> json) {
  return Dob(json['date'] as String, json['age'] as int);
}

Map<String, dynamic> _$DobToJson(Dob instance) =>
    <String, dynamic>{'date': instance.date, 'age': instance.age};

Registered _$RegisteredFromJson(Map<String, dynamic> json) {
  return Registered(json['date'] as String, json['age'] as int);
}

Map<String, dynamic> _$RegisteredToJson(Registered instance) =>
    <String, dynamic>{'date': instance.date, 'age': instance.age};

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(json['name'] as String, json['value'] as String);
}

Map<String, dynamic> _$IdToJson(Id instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(json['large'] as String, json['medium'] as String,
      json['thumbnail'] as String);
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail
    };

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return PageInfo(json['seed'] as String, json['results'] as int,
      json['page'] as int, json['version'] as String);
}

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'seed': instance.seed,
      'results': instance.results,
      'page': instance.page,
      'version': instance.version
    };
