



class MenuGroup {
   String menuPercentage;
   int quantity;
   String id,name,image;
   List sellableItemList;

  MenuGroup({this.menuPercentage, this.quantity,this.id ,this.sellableItemList,this.name,this.image});

   MenuGroup.fromMap(Map<String, dynamic> data){
     id = data['id'];
     name = data["name"];
     sellableItemList = data['price'];
     quantity= data['quantity'];
   }
}

