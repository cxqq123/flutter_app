import 'package:flutter/material.dart';

//model类
class Product{
  const Product({this.name});
  final String name;
}

//自定义一个图表改变回调方法
typedef void CartChangedCallback(Product product , bool inCart);


//List中的每一个item
class ShoppingListItem extends StatelessWidget{
  
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle getTextStyle(BuildContext context){
    if(!inCart){
      return null;
    }

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  //构造方法
  ShoppingListItem({
    Product product,
    this.inCart,
    this.onCartChanged}):
    product = product,
    super(key : new ObjectKey(product));
  
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap:(){
        onCartChanged(product , !inCart);
      },
      //头像
      leading: new CircleAvatar(
        backgroundColor: getColor(context),
        //取第一个字
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name , style: getTextStyle(context),),
    );
  }
  
}

class ShoppingList extends StatefulWidget{

  final List<Product> products;

  //构造方法
  ShoppingList({
    Key key,
    this.products
  }) : super(key : key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }
}

//用"_"来表示私有的
class _ShoppingListState extends State<ShoppingList>{

  //用来存shopping的集合
  Set<Product> _shoppingCart = new Set<Product>();

  void handleCartChanged(Product product , bool inCart){
    setState(() {
//      _ShoppingListState通过添加或删除产品来改变其内部_shoppingCart状态
      if(inCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("shopping List"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children : widget.products.map((Product product){
          //遍历widget中的products中的每一个product
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            //绑定事件
            onCartChanged: handleCartChanged,
          );
        }).toList()
      ),
    );
  }
}

void main(){
  runApp(new MaterialApp(
    title: 'Shopping App',
    home: new ShoppingList(
      products: <Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

