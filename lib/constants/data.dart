import 'package:shop_box/models/menu_group_model.dart';
import 'package:shop_box/models/sellableItem_model.dart';

List<String> testImageList = [
  "https://png.pngtree.com/png-clipart/20201208/original/pngtree-combo-offer-design-in-geometric-style-png-image_5516268.jpg",
  "https://cdn.xxl.thumbs.canstockphoto.com/special-offer-banner-poster-background-sale-promotion-offer-template-design-vector-yellow-sale-drawing_csp88446299.jpg",
  "https://image.shutterstock.com/z/stock-vector-you-win-design-element-eps-cmyk-254863618.jpg"
];

List<MenuGroup> menuList = [
  MenuGroup(
     image:"https://png.pngtree.com/png-clipart/20201208/original/pngtree-combo-offer-design-in-geometric-style-png-image_5516268.jpg" ,
      name: "menu1",
      id: "99",
      sellableItemList: [
    SellableItem(
      id: "1",
      name: "burger",
      price: "20",
      image:
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      tax: "15",
      percentage: "80",
    ),
    SellableItem(
      id: "2",
        name: "fries",
        price: "5",
        image:
        "https://static.fanpage.it/wp-content/uploads/sites/22/2020/09/iStock-618214356-1200x1200.jpg",
        tax: "8",
        percentage: "70"),
    SellableItem(
      id: "3",
        name: "pepsi",
        price: "10",
        image:
        "https://live.staticflickr.com/65535/50126485572_affedd4315_b.jpg",
        tax: "10",
        percentage: "40")
  ])

  ,MenuGroup(
    image: "https://cdn.xxl.thumbs.canstockphoto.com/special-offer-banner-poster-background-sale-promotion-offer-template-design-vector-yellow-sale-drawing_csp88446299.jpg",
      name: "Menu2",
      id: "100",
      sellableItemList: [
        SellableItem(
          id: "4",
          name: "chicken",
          price: "15",
          image:
          "https://thestayathomechef.com/wp-content/uploads/2016/06/Fried-Chicken-4-1-500x375.jpg",
          tax: "12",
          percentage: "45",
        ),
        SellableItem(
            id: "5",
            name: "hotdog",
            price: "18",
            image:
            "https://www.foodandfriends.nl/app/uploads/2020/12/Champignon-hotdogs-de-groentekeuken.jpg",
            tax: "14",
            percentage: "20"),
        SellableItem(
            id: "6",
            name: "sunday",
            price: "8",
            image:
            "https://www.calorie-charts.info/products/big/zwnexnlfqqwlgrgzwmcl.png",
            tax: "5",
            percentage: "35")
      ])
  ,MenuGroup(
    image: "https://image.shutterstock.com/z/stock-vector-you-win-design-element-eps-cmyk-254863618.jpg",
      name: "Menu3",
      id: "101",
      sellableItemList: [
        SellableItem(
          id: "7",
          name: "ice mocha",
          price: "17",
          image:
          "https://easyweeknightrecipes.com/wp-content/uploads/2020/08/Mocha-Iced-Coffee-5.jpg",
          tax: "16",
          percentage: "42",
        ),
        SellableItem(
            id: "9",
            name: "cheese",
            price: "8",
            image:
            "https://media.istockphoto.com/photos/cheese-on-white-picture-id1127471287?k=20&m=1127471287&s=170667a&w=0&h=md8EzisxLE73EZ2dY_iPkTmtSzgfiTmAwB8jKcW2-7w=",
            tax: "14",
            percentage: "20"),

      ])
];