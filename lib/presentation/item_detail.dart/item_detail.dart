import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class ItemDetail extends StatefulWidget {
  final ComicsSummary comicsSummary;
  ItemDetail({Key key, @required this.comicsSummary}) : super(key: key);
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

final cartController = GetIt.I.get<CartController>();

class _ItemDetailState extends State<ItemDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Detalhes"),
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    height: 200,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                      child: Text(
                    widget.comicsSummary.title,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Expanded(
                    child: Text(
                  widget.comicsSummary.description != null
                      ? widget.comicsSummary.description
                      : "",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
                Expanded(
                    child: Text(
                  widget.comicsSummary.prices[0].price != 0.0
                      ? "Valor: R\$" +
                          widget.comicsSummary.prices[0].price.toString()
                      : "Indisponivel",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )),
                RaisedButton(
                  onPressed: () {
                    if (widget.comicsSummary.prices[0].price == 0.0) {
                      Fluttertoast.showToast(
                          msg: "Indisponivel",
                          //toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Adicionado ao carrinho",
                          //toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      cartController.addItemCart(widget.comicsSummary);
                      Navigator.of(context).pop();
                    }
                  },
                  color: Colors.red,
                  child: Text("Adicionar ao Carrinho"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
