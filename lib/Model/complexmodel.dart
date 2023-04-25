
class VeryComplexModel {
  bool? success;
  String? message;
  List<Data>? data;

  VeryComplexModel({this.success, this.message, this.data});

  VeryComplexModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Categories? categories;
  Subcat? subcat;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? color;
  String? size;
  bool? inWishlist;
  List<Images>? images;

  Data({this.id, this.onSale, this.salePercent, this.sold, this.sliderNew, this.sliderRecent, this.sliderSold, this.date, this.title, this.categories, this.subcat, this.shop, this.price, this.saleTitle, this.salePrice, this.description, this.color, this.size, this.inWishlist, this.images});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["on_sale"] is bool) {
      onSale = json["on_sale"];
    }
    if(json["sale_percent"] is int) {
      salePercent = json["sale_percent"];
    }
    if(json["sold"] is int) {
      sold = json["sold"];
    }
    if(json["slider_new"] is bool) {
      sliderNew = json["slider_new"];
    }
    if(json["slider_recent"] is bool) {
      sliderRecent = json["slider_recent"];
    }
    if(json["slider_sold"] is bool) {
      sliderSold = json["slider_sold"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["categories"] is Map) {
      categories = json["categories"] == null ? null : Categories.fromJson(json["categories"]);
    }
    if(json["subcat"] is Map) {
      subcat = json["subcat"] == null ? null : Subcat.fromJson(json["subcat"]);
    }
    if(json["shop"] is Map) {
      shop = json["shop"] == null ? null : Shop.fromJson(json["shop"]);
    }
    if(json["price"] is String) {
      price = json["price"];
    }
    if(json["sale_title"] is String) {
      saleTitle = json["sale_title"];
    }
    if(json["sale_price"] is String) {
      salePrice = json["sale_price"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
    if(json["size"] is String) {
      size = json["size"];
    }
    if(json["in_wishlist"] is bool) {
      inWishlist = json["in_wishlist"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["on_sale"] = onSale;
    _data["sale_percent"] = salePercent;
    _data["sold"] = sold;
    _data["slider_new"] = sliderNew;
    _data["slider_recent"] = sliderRecent;
    _data["slider_sold"] = sliderSold;
    _data["date"] = date;
    _data["title"] = title;
    if(categories != null) {
      _data["categories"] = categories?.toJson();
    }
    if(subcat != null) {
      _data["subcat"] = subcat?.toJson();
    }
    if(shop != null) {
      _data["shop"] = shop?.toJson();
    }
    _data["price"] = price;
    _data["sale_title"] = saleTitle;
    _data["sale_price"] = salePrice;
    _data["description"] = description;
    _data["color"] = color;
    _data["size"] = size;
    _data["in_wishlist"] = inWishlist;
    if(images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Images {
  String? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["url"] = url;
    return _data;
  }
}

class Shop {
  String? id;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;

  Shop({this.id, this.isActive, this.createdAt, this.name, this.description, this.shopemail, this.shopaddress, this.shopcity, this.userid, this.image});

  Shop.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["is_active"] is bool) {
      isActive = json["is_active"];
    }
    if(json["created_At"] is String) {
      createdAt = json["created_At"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["shopemail"] is String) {
      shopemail = json["shopemail"];
    }
    if(json["shopaddress"] is String) {
      shopaddress = json["shopaddress"];
    }
    if(json["shopcity"] is String) {
      shopcity = json["shopcity"];
    }
    if(json["userid"] is String) {
      userid = json["userid"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["is_active"] = isActive;
    _data["created_At"] = createdAt;
    _data["name"] = name;
    _data["description"] = description;
    _data["shopemail"] = shopemail;
    _data["shopaddress"] = shopaddress;
    _data["shopcity"] = shopcity;
    _data["userid"] = userid;
    _data["image"] = image;
    return _data;
  }
}

class Subcat {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;

  Subcat({this.id, this.type, this.salePercent, this.date, this.name});

  Subcat.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["sale_percent"] is int) {
      salePercent = json["sale_percent"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["type"] = type;
    _data["sale_percent"] = salePercent;
    _data["date"] = date;
    _data["name"] = name;
    return _data;
  }
}

class Categories {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;
  String? image;

  Categories({this.id, this.type, this.salePercent, this.date, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["sale_percent"] is int) {
      salePercent = json["sale_percent"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["type"] = type;
    _data["sale_percent"] = salePercent;
    _data["date"] = date;
    _data["name"] = name;
    _data["image"] = image;
    return _data;
  }
}