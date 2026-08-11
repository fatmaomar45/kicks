import 'package:flutter/material.dart';
import 'package:kicks/model/cart.dart';
import 'package:kicks/model/product.dart';
import 'package:kicks/screens/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  final List<Widget> _tabs = const [
    _HomeTab(),
    _CartTab(),
    _OrdersTab(),
    _ProfileTab(),
  ];

  final List<String> _titles = const [
    "Home",
    'Cart',
    "Orders",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedTab]),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.home),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: "Order",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        final currentProduct = dummyProducts[index];
        return ProductCard(product: currentProduct);
      },
    );
  }
}

// the cart tab
class _CartTab extends StatelessWidget{
  const _CartTab();
  
  @override
  Widget build(BuildContext context) {
   return Consumer<CartModel>(
    builder:(context,cart,child){
      if(cart.items.isEmpty){
       return Center(child: Text('Your cart is empty'));
      }
      return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index){
          final item=cart.items[index];
          return ProductCard(product:item);
        }
      );


    });
   
  }
}



//the orders tab
class _OrdersTab extends StatelessWidget {
  const _OrdersTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Orders"),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
