import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/models/ProductsModel.dart';
import 'package:shooping_app/scoped-model/MainModel.dart';
import 'package:shooping_app/utils/Const.dart';

class DetailsScreen extends StatefulWidget {
  MainModel model;

  DetailsScreen({Key key, this.model}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // ProductsModel productsModel;

  int counterIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    // productsModel = widget.model.productsModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsModel =
        ModalRoute.of(context).settings.arguments as ProductsModel;
    return Scaffold(
      backgroundColor: productsModel.color ?? Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              CupertinoIcons.search,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.cart_badge_plus,
            ),
          ],
        ),
        backgroundColor: productsModel.color ?? Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  bottomPart(productsModel, size),
                  headerpart(productsModel),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  headerpart(productsModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            productsModel.productName,
            style: TextStyle(
                color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      productsModel.productPrice.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 60),
              Expanded(
                child: Hero(
                  tag: productsModel.heroTag,
                  child: Image.asset(
                    productsModel.productImg,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  bottomPart(productsModel, size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(
        top: size.height * 0.12,
        left: 20,
        right: 20,
      ),
      // height: 500,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color",
                      style:
                          TextStyle(color: Colors.grey, fontFamily: "MonteMed"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dot(Colors.black, true),
                        SizedBox(
                          width: 3,
                        ),
                        dot(Colors.red, false),
                        SizedBox(
                          width: 3,
                        ),
                        dot(Colors.green, false),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style:
                          TextStyle(color: Colors.grey, fontFamily: "MonteMed"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      productsModel.size.toString() + " CM",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "MonteMed"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(Const.desc),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        if (counterIndex != 1) counterIndex--;
                      });
                    },
                    elevation: 2.0,
                    color: Colors.white,
                    minWidth: 23,
                    child: Icon(
                      Icons.remove,
                      size: 15.0,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                  Text(
                    counterIndex.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "MonteMed"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        counterIndex++;
                      });
                    },
                    elevation: 2.0,
                    //fillColor: Colors.white,
                    color: Colors.white,
                    minWidth: 23,
                    child: Icon(
                      Icons.add,
                      size: 15.0,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(9.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              Image.asset(
                "assets/wish-list.png",
                height: 33,
                width: 33,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //Spacer(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    border: Border.all(color: productsModel.color),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.add_shopping_cart,
                  color: productsModel.color,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      color: productsModel.color,
                      border: Border.all(color: productsModel.color),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dot(Color color, isSelect) {
    return Container(
      padding: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelect ? color : Colors.transparent,
        ),
      ),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
