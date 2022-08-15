class Practicemodel {
  final int id;
  final String name, user, email, phone, website;
  final Addressmodel add;
  final Companymodel com;
  factory Practicemodel.fromjson(Map<String, dynamic> myjson) {
    return Practicemodel(
        myjson['id'],
        myjson['name'],
        myjson['username'],
        myjson['email'],
        myjson['phone'],
        myjson['website'],
        Addressmodel.fromjson(myjson['address']),
        Companymodel.fromjson(myjson['company']));
  }
  Practicemodel(this.id, this.name, this.user, this.email, this.phone, this.website,
      this.add, this.com);
}

class Addressmodel {
  final String strret, suite, city, zipcode;
  final Geomodel geo;
  factory Addressmodel.fromjson(Map<String, dynamic> myjson) {
    return Addressmodel(myjson['street'], myjson['suite'], myjson['city'],
        myjson['zipcode'], Geomodel.fromjson(myjson['geo']));
  }
  Addressmodel(this.strret, this.suite, this.city, this.zipcode, this.geo);
}

class Geomodel {
  final String lat, lng;
  factory Geomodel.fromjson(Map<String, dynamic> myjson) {
    return Geomodel(myjson['lat'], myjson['lng']);
  }
  Geomodel(this.lat, this.lng);
}

class Companymodel {
  final String name, catchp, bs;
  factory Companymodel.fromjson(Map<String, dynamic> myjson) {
    return Companymodel(myjson['name'], myjson['catchPhrase'], myjson['bs']);
  }
  Companymodel(this.name, this.catchp, this.bs);
}
