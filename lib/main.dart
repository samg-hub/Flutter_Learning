import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      home: ShoppingList(
        products :<Product>[
          Product(name: 'Eggs'),
          Product(name: 'Chips'),
          Product(name: 'Chicken'),
          Product(name: 'Hens'),
          Product(name: 'Yogurt'),
          Product(name: 'Pizza')
        ]
      ),
    );
  }
  
}

class ShoppingList extends StatefulWidget{
  final List<Product> products ;
  const ShoppingList({Key? key ,required this.products}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ShoppinglistState();
}

typedef CardChangeCallBack = void Function(Product item,bool inCart);

class ShoppinglistState extends State<ShoppingList>{
  Set<Product> shoppingCard = <Product>{};

  void handleCardChange(Product item,bool inCart){
    setState(() {
      if(inCart){
        shoppingCard.remove(item);
        print("no");
      }else{
        shoppingCard.add(item);
        print("yesss");
      }
    });
  }

  // List<Product> getListOfProducts(List<Product> list){
  //   List<Product> checkList = <Product>[];
  //   for(int i = 0;i < list.length;i++){
  //     checkList.add(Product(name: list[i].name));
  //   }
  //   return checkList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product item){
          return ShoppingListItem(
              product: item,
              inCart: shoppingCard.contains(item),
              onCardChange:handleCardChange);
        }).toList(), 
      ),
    );
  }
}
class ShoppingListItem extends StatelessWidget{
  final Product product;
  final CardChangeCallBack onCardChange;
  final bool inCart;
  const ShoppingListItem({Key? key, required this.product, required this.onCardChange, required this.inCart}) : super(key: key);

  Color getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  TextStyle? getTextStyle(BuildContext context){
    if(inCart){
      return const TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.lineThrough
      );
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCardChange(product,inCart);
      },
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(product.name[1]),
      ),
      title: Text(product.name,style: getTextStyle(context)),
    );
  }
}

class Product{
  final String name;
  Product({required this.name});
}