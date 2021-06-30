import 'dart:ui';

import 'package:shooping_app/utils/Const.dart';

class ProductsModel {
  String productImg;
  String productName;
  int productPrice;
  Color color;
  int size;
  int heroTag;

  ProductsModel(
      {this.productImg,
      this.productName,
      this.productPrice,
      this.color,
      this.size,
      this.heroTag});

  static List<ProductsModel> generateData() {
    List<ProductsModel> list = [
      ProductsModel(
        productImg: "assets/bags/bag_1.png",
        productName: "Office Code",
        productPrice: 201,
        size: 12,
        heroTag: 1,
        color: Const.colors[0],
      ),
      ProductsModel(
        productImg: "assets/bags/bag_2.png",
        productName: "Belt Bag",
        productPrice: 231,
        size: 8,
        heroTag: 2,
        color: Const.colors[1],
      ),
      ProductsModel(
        productImg: "assets/bags/bag_3.png",
        productName: "Hang Top",
        productPrice: 401,
        size: 22,
        heroTag: 3,
        color: Const.colors[2],
      ),
      ProductsModel(
        productImg: "assets/bags/bag_4.png",
        productName: "Old Fashion",
        productPrice: 101,
        size: 90,
        heroTag: 4,
        color: Const.colors[3],
      ),
      ProductsModel(
        productImg: "assets/bags/bag_5.png",
        productName: "New Code",
        productPrice: 431,
        heroTag: 5,
        size: 19,
        color: Const.colors[4],
      ),
      ProductsModel(
        productImg: "assets/bags/bag_6.png",
        productName: "New Grill Code",
        productPrice: 901,
        size: 29,
        heroTag: 6,
        color: Const.colors[5],
      ),
    ];
    return list;
  }
}
