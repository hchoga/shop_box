class SellableItem {
  String id, name, image, menuName;
  String price, tax, percentage;
  String type;
  SellableItem(
      {this.price, this.id, this.image, this.tax, this.percentage, this.name, this.menuName,this.type});

  SellableItem.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data["name"];
    price = data['price'];
    image = data['image'];
    tax = data['tax'];
    percentage = data['percentage'];
  }
}