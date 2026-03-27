class CartManager {

  static List<Map<String,dynamic>> cartItems = [];

  static void addItem(Map<String,dynamic> medicine){

    int index = cartItems.indexWhere(
          (item) => item["title"] == medicine["title"],
    );

    /// if already in cart → increase qty
    if(index != -1){

      cartItems[index]["qty"]++;

    }
    else{

      cartItems.add({

        "image": medicine["image"],
        "title": medicine["title"],
        "price": medicine["price"],
        "qty": 1,

      });

    }

  }

}