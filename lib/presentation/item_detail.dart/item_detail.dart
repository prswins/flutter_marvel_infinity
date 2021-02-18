import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../app_localizations.dart';

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
        title: Text(AppLocalizations.of(context).translate('detail_titulo')),
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: OrientationBuilder(builder: (context, orientation) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: orientation == Orientation.portrait
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // ImageBox(widget: widget,),
                        widget.comicsSummary.images.isNotEmpty
                            ? Image.network(
                                widget.comicsSummary.images[0].path + ".jpg",
                                height: 200,
                                width: 200,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  print(context);
                                  print(error);
                                  print(stackTrace);
                                  return Text(error);
                                },
                              )
                            : ImageBox(
                                widget: widget,
                              ),
                        Expanded(
                            flex: 1,
                            child: Titulo(
                              widget: widget,
                            )),
                        Expanded(flex: 2, child: Descricao(widget: widget)),
                        Valor(widget: widget),
                        Botao(widget: widget)
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(child: Titulo(widget: widget)),
                        Row(
                          children: [
                            widget.comicsSummary.images.isNotEmpty
                            ? Image.network(
                                widget.comicsSummary.images[0].path + ".jpg",
                                height: 200,
                                width: 200,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  print(context);
                                  print(error);
                                  print(stackTrace);
                                  return Text(error);
                                },
                              )
                            : ImageBox(
                                widget: widget,
                              ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Descricao(widget: widget),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Valor(widget: widget),
                                  Botao(widget: widget)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            );
          }),
        ),
      ),
    );
  }
}

class Botao extends StatelessWidget {
  const Botao({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemDetail widget;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (widget.comicsSummary.prices[0].price == 0.0) {
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context)
                  .translate('detail_item_indisponivel'),
              //toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context).translate('store_msg_item_add'),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(AppLocalizations.of(context).translate('detail_botao_add'),
              style: TextStyle(
                color: Colors.white,
              )),
          Icon(
            Icons.shopping_cart_sharp,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Valor extends StatelessWidget {
  const Valor({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemDetail widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
          child: Text(
        widget.comicsSummary.prices[0].price != 0.0
            ? "R\$" + widget.comicsSummary.prices[0].price.toString()
            : AppLocalizations.of(context)
                .translate('detail_item_indisponivel'),
        style: TextStyle(color: Colors.white, fontSize: 30),
      )),
    );
  }
}

class Descricao extends StatelessWidget {
  const Descricao({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemDetail widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.comicsSummary.description != null
          ? widget.comicsSummary.description
          : "",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  const Titulo({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemDetail widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.comicsSummary.title,
        style: TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ItemDetail widget;

  @override
  Widget build(BuildContext context) {
    return Center(
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
        child: widget.comicsSummary.images.isNotEmpty
            ? Image.network(
                widget.comicsSummary.images[0].path + ".jpg",
                errorBuilder: (context, error, stackTrace) {
                  print(context);
                  print(error);

                  print(stackTrace);

                  return Text("nao tem imagem");
                },
              )
            : SizedBox(
                height: 0,
              ),
      ),
    );
  }
}
