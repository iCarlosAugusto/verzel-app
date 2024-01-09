class OfferModel {
  String id;
  String name;
  String brand;
  String model;
  String imageUrl;
  int price;

  OfferModel(this.id, this.name, this.brand, this.imageUrl, this.model, this.price);

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      json['id'] as String,
      json['name'] as String,
      json['brand'] as String,
      json['model'] as String,
      json['imageUrl'] as String,
      json['price'] as int
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}