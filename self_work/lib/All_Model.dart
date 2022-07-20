//////Post Model////////---------------------------
class Postmodel {
  final int userid, id;
  final String title, body;
  factory Postmodel.fromjson(Map<String, dynamic> myjson) {
    return Postmodel(
        myjson['userId'], myjson['id'], myjson['title'], myjson['body']);
  }
  Postmodel(this.userid, this.id, this.title, this.body);
}

//////////////User Model////////-----------------
class Usermodel {
  final Addressmodel add;
  final Companymodel com;
  final int id;
  final String name, username, email, phone, website;
  factory Usermodel.fromjson(Map<String, dynamic> data) {
    return Usermodel(
        data['id'],
        data['name'],
        data['username'],
        data['email'],
        data['phone'],
        data['website'],
        Addressmodel.fromjson(data['address']),
        Companymodel.fromjson(data['company']));
  }
  Usermodel(this.id, this.name, this.username, this.email, this.phone,
      this.website, this.add, this.com);
}

class Addressmodel {
  final Geomodel geo;
  final String street, suite, city, zipcode;
  factory Addressmodel.fromjson(Map<String, dynamic> data) {
    return Addressmodel(data['street'], data['suite'], data['city'],
        data['zipcode'], Geomodel.fromjson(data['geo']));
  }
  Addressmodel(this.street, this.suite, this.city, this.zipcode, this.geo);
}

class Geomodel {
  final String lat, lng;
  factory Geomodel.fromjson(Map<String, dynamic> data) {
    return Geomodel(data['lat'], data['lng']);
  }
  Geomodel(this.lat, this.lng);
}

class Companymodel {
  final String name, catchphrase, bs;
  factory Companymodel.fromjson(Map<String, dynamic> data) {
    return Companymodel(data['name'], data['catchPhrase'], data['bs']);
  }
  Companymodel(this.name, this.catchphrase, this.bs);
}

////////TodosMOdel///////-------------
class Todosmodel {
  final int uid, id;
  final String title;
  final bool complete;
  factory Todosmodel.fromjson(Map<String, dynamic> myjson) {
    return Todosmodel(
        myjson['userId'], myjson['id'], myjson['title'], myjson['completed']);
  }
  Todosmodel(this.uid, this.id, this.title, this.complete);
}
