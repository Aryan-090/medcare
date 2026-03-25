class ProductModel {

  final String name;
  final String image;
  final String category;
  final String price;

  ProductModel({

    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });

}

/// all products list
List<ProductModel> allProducts = [

  ProductModel(
    name: "Promag 10 Tablets",
    image: "assets/medicine/promag.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

  ProductModel(
    name: "Neurodex 10 Tablet",
    image: "assets/medicine/strip.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

  ProductModel(
    name: "Bodrex Medicine",
    image: "assets/medicine/bodrex.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

  ProductModel(
    name: "Paratusin Tablet",
    image: "assets/medicine/paratusin.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

  ProductModel(
    name: "bufect Strip of 4 Tablet",
    image: "assets/medicine/bufect.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

  ProductModel(
    name: "myanta Strip",
    image: "assets/medicine/myanta.png",
    category: "Medicine & Treatment",
    price: "\$2,00",
  ),

];