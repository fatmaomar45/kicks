import 'package:flutter/material.dart';
import 'package:kicks/model/cart_items.dart';

class CartCard extends StatelessWidget{
  final CartItem cartItem;
  final VoidCallback increment;
  final VoidCallback decrement;



  const CartCard({super.key,
   required this.cartItem,
   required this.increment,
   required this.decrement,
  });

@override
  Widget build(BuildContext context) {
    

    return Card(
      margin: EdgeInsets.only(left:16,right:16,top:8,bottom: 8),
      child:Padding(padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRect(
          // borderRadius:BorderRadius.circular(8),
          child: Image.network(cartItem.product.imageUrl,width: 120,height:120 ),
          ),

 
          SizedBox(width:12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product.name),
                Text(cartItem.product.description),
                Row(
                  children: [
                    Text('KES ${cartItem.itemTotal}'),
                    const Spacer(),
                    IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('${cartItem.quantity}'),
                    IconButton(
                      onPressed: increment,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ),

      
    );
  }
}



