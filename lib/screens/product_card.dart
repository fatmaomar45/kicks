
import 'package:flutter/material.dart';
import 'package:kicks/model/cart.dart';
import 'package:kicks/model/product.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left:16,right:16,top:8,bottom: 8),
      child:Padding(padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRect(
          // borderRadius:BorderRadius.circular(8),
          child: Image.network(widget.product.imageUrl,width: 120,height:120 ),
          ),
          
          
          SizedBox(width:12),

          Expanded(child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.product.name),
              Text(widget.product.description),
              
              Row(children: [
                Text('KES ${widget.product.price}'),

                Spacer(flex: 1,),

                IconButton(
                onPressed: (){Provider.of<CartModel>(
                  context,
                  listen: false,
                ).addItem(widget.product);
                },
                icon: Icon(Icons.shopping_cart_outlined,size:20),)
              ],)
              
            ],
          ))
        ],
      ),
      ),

      
    );
  }
}

