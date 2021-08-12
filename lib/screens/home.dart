import 'package:flutter/material.dart';
import 'package:magaluiza/models/products.dart';
import 'package:magaluiza/provider/list_of_products.dart';
import 'package:magaluiza/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.jpg"),
        title: Text(
          "Ofertas do dia",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/linha.jpg"),
          Expanded(
            child: ListView.builder(
              itemBuilder: builder,
              itemCount: listOfProducts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget builder(BuildContext _, int index) {
    Products _products = listOfProducts.elementAt(index);
    return ListTile(
      trailing: IconButton(
        icon: (_products.isFavorite)
            ? Icon(
                Icons.favorite,
                color: pinkTheme.shade400,
              )
            : Icon(
                Icons.favorite_outline,
                color: pinkTheme.shade500,
              ),
        onPressed: () {
          setState(() {
            _products.isFavorite = !_products.isFavorite;
          });
        },
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Image.asset(
              _products.photo,
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 10,
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _products.name,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  _products.description,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "RS " + _products.price,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: blueTheme.shade800,
                  ),
                ),
                Text(
                  _products.installmentPrice,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: blueTheme.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
