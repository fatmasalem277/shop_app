class ProductModels {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModels(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  ProductModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  double? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

// {"id":1,
// "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
// "price":109.95,
// "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
// "category":"men's clothing",
// "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
// "rating":{"rate":3.9,"count":120}}
