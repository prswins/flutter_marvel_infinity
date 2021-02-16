import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

final controller = GetIt.I.get<CartController>();

class _CartState extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Carrinho de compras",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Observer(builder: (context) {
            return controller.listToBuy.length == 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Sem itens'),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listToBuy.length,
                      itemBuilder: (context, index) {
                        return cartItem(
                            context, controller.listToBuy[index], index, 9.00);
                      },
                    ),
                  );
          }),
          Observer(builder: (_) {
            return controller.listToBuy.length >= 1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Total: ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "R\$ " +
                                (controller.listToBuy.length * 9.99)
                                    .toStringAsFixed(2)
                                    .toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                : SizedBox();
          }),
          Observer(builder: (_) {
            return controller.listToBuy.length >= 1
                ? FlatButton(
                    child: Text(
                      "Fechar Pedido",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  )
                : SizedBox();
          })
        ],
      ),
    );
  }

  Widget cartItem(
      BuildContext context, ComicsSummary comic, int position, double price) {
    return Card(
      elevation: 2,
      child: ListTile(
        //leading: Text(comic.qtd.toString(),style: TextStyle(),),
        title: Expanded(child: Text(comic.title)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "R\$",
              style: TextStyle(
                  //color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "9,99",
              style: TextStyle(
                  //color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  controller.removeItemCart(position);
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
