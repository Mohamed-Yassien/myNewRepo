

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:givemeamoment/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = 'productDetail';
  @override
  Widget build(BuildContext context) {
    final productId =  ModalRoute.of(context).settings.arguments as String;

    final loadedProduct = Provider.of<Products>(context,listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text('\$${loadedProduct.price}',style: TextStyle(color: Colors.grey,fontSize: 25),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(loadedProduct.description,softWrap:true,style: TextStyle(fontSize: 22),),
            ),
          ],
        ),
      ),
    );
  }
}
