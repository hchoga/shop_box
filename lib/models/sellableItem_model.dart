class SellableItem {
  String id, name, image, menuName;
  String price, tax, percentage;

  SellableItem(
      {this.price, this.id, this.image, this.tax, this.percentage, this.name, this.menuName});

  SellableItem.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data["name"];
    price = data['price'];
    image = data['image'];
    tax = data['tax'];
    percentage = data['percentage'];
  }
}