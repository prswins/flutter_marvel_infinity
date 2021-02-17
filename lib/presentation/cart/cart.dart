import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/app_localizations.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:flutter_marvel_infinity/controller/profile_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

final controller = GetIt.I.get<CartController>();
final profileController = GetIt.I.get<ProfileController>();

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
                AppLocalizations.of(context).translate('cart_titulo'),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Observer(builder: (context) {
            //return controller.listToBuy.length == 0
            return controller.itensCarrinho.length == 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(AppLocalizations.of(context).translate('cart_carrinho_vazio')),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      //itemCount: controller.listToBuy.length,
                      itemCount: controller.itensCarrinho.length,
                      itemBuilder: (context, index) {
                        return cartItem(
                            // context, controller.listToBuy[index], index, 9.00);
                            context,
                            controller.itensCarrinho[index],
                            index,
                            9.00);
                      },
                    ),
                  );
          }),
          Observer(builder: (_) {
            //return controller.listToBuy.length >= 1
            return controller.itensCarrinho.length >= 1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(AppLocalizations.of(context).translate('order_total'),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Observer(builder: (_) {
                          return Text(
                              
                                  //(controller.listToBuy.length * 9.99)
                                  controller
                                      .totalCarrinho()
                                      .toStringAsFixed(2)
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold));
                        }),
                      ],
                    ),
                  )
                : SizedBox();
          }),
          Observer(builder: (_) {
            return controller.itensCarrinho.length >= 1
                ? FlatButton(
                    child: Text(
                      AppLocalizations.of(context).translate('cart_botao_fechar_pedido'),
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () async {
                      PedidoFechado pedidoFechado = controller.fecharPedido();
                      print(pedidoFechado);
                      profileController.addItemPedido(pedidoFechado);
                      setState(() {});
                      Fluttertoast.showToast(
                        msg: AppLocalizations.of(context).translate('cart_botao_msg'),
                        //toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    
                      
                    },
                  )
                : SizedBox();
          })
        ],
      ),
    );
  }

  Widget cartItem(
      BuildContext context, ItemCarrinho comic, int position, double price) {
    return Card(
      elevation: 2,
      child: ListTile(
        //leading: Text(comic.qtd.toString(),style: TextStyle(),),
        title: Expanded(child: Text(comic.comicsSummary.title)),
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
              comic.comicsSummary.prices[0].price.toStringAsFixed(2).toString(),
              style: TextStyle(
                  //color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            /*InkWell(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  controller.removeItemCart(position);
                  setState(() {});
                })*/
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: controlarItens(context, comic.qtd, position),
            )
          ],
        ),
      ),
    );
  }

  Widget controlarItens(BuildContext context, int qtd, int position) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
            child: Icon(
              Icons.remove_sharp,
              color: Colors.red,
            ),
            onTap: () {
              controller.removeItemCart(position);
              setState(() {});
            }),
        Text(qtd.toString(),
            style: TextStyle(
              //color: Colors.red,
              fontWeight: FontWeight.bold,
            )),
        InkWell(
            child: Icon(
              Icons.add_sharp,
              color: Colors.red,
            ),
            onTap: () {
              controller.quickAddItemCart(position);
              setState(() {});
            }),
      ],
    );
  }
}
