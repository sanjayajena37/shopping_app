import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/models/ProductsModel.dart';
import 'package:shooping_app/scoped-model/MainModel.dart';
import 'package:shooping_app/utils/Const.dart';

class DashboardScreen extends StatefulWidget {
  MainModel model;

  DashboardScreen({Key key, this.model}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<ProductsModel> gridValue = ProductsModel.generateData();
  List<String> categoryList = [
    "Hang bag",
    "Jewellery",
    "Footwear",
    "Dresscode",
    "Hang bag",
    "Jewellery",
    "Footwear",
    "Dresscode",
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.cart_badge_plus,
              color: Colors.black,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        leading: Icon(
          CupertinoIcons.arrow_left,
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Divider(
            height: 1,
          ),*/
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Women",
              style: TextStyle(
                  color: Colors.black, fontFamily: "MonteMed", fontSize: 29),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          buildHorizontalListTile(context),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(4.0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.75,
                          crossAxisCount: 2),
                      itemBuilder: (context, i) {
                        ProductsModel model = gridValue[i];
                        return buildTile(model);
                      },
                      itemCount: gridValue.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildTile(ProductsModel model) {
    return InkWell(
      onTap: () {
        widget.model.productsModel = model;
        Navigator.pushNamed(context, "/details", arguments: model);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: model.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Hero(
                  tag: model.heroTag,
                  child: Image.asset(
                    model.productImg,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              model.productName,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(
              Const.dollar + model.productPrice.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  buildHorizontalListTile(context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          String name = categoryList[i];
          return InkWell(
            onTap: () {
              setState(() {
                selectIndex = i;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: (selectIndex == i) ? Colors.black : Colors.grey),
                  ),
                  (selectIndex == i)
                      ? Container(
                          width: 40,
                          margin: EdgeInsets.only(top: 4),
                          height: 3,
                          color: Colors.black,
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
