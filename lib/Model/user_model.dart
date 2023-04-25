class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["username"] is String) {
      username = json["username"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["address"] is Map) {
      address =
          json["address"] == null ? null : Address.fromJson(json["address"]);
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["website"] is String) {
      website = json["website"];
    }
    if (json["company"] is Map) {
      company =
          json["company"] == null ? null : Company.fromJson(json["company"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["username"] = username;
    data["email"] = email;
    if (address != null) {
      data["address"] = address?.toJson();
    }
    data["phone"] = phone;
    data["website"] = website;
    if (company != null) {
      data["company"] = company?.toJson();
    }
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["catchPhrase"] is String) {
      catchPhrase = json["catchPhrase"];
    }
    if (json["bs"] is String) {
      bs = json["bs"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["catchPhrase"] = catchPhrase;
    data["bs"] = bs;
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    if (json["street"] is String) {
      street = json["street"];
    }
    if (json["suite"] is String) {
      suite = json["suite"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["zipcode"] is String) {
      zipcode = json["zipcode"];
    }
    if (json["geo"] is Map) {
      geo = json["geo"] == null ? null : Geo.fromJson(json["geo"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["street"] = street;
    data["suite"] = suite;
    data["city"] = city;
    data["zipcode"] = zipcode;
    if (geo != null) {
      data["geo"] = geo?.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    if (json["lat"] is String) {
      lat = json["lat"];
    }
    if (json["lng"] is String) {
      lng = json["lng"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }
}
