import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:flutter_marvel_infinity/presentation/cart/cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class ComicsGridItem extends StatelessWidget {
  final controller = GetIt.I.get<CartController>();

  ComicsGridItem({
    @required this.item,
    Key key,
  })  : assert(item != null),
        super(key: key);
  final ComicsSummary item;

  @override
  Widget build(BuildContext context) => InkWell(
        highlightColor: Colors.redAccent,
        onTap: () => Fluttertoast.showToast(
            msg:
                item.description != null ? item.description : 'Sem informações',
            //toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0),
        child: Card(
          shadowColor: Colors.red,
          margin: EdgeInsets.all(4),
          elevation: 2,
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Item adicionado ao Carrinho',
                        //toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    controller.addItemCart(item);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("R\$ 9,99",
                            style: TextStyle(color: Colors.white)),
                      ),
                      Icon(
                        Icons.shopping_cart_sharp,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
