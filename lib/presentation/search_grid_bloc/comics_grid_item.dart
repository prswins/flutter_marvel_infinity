import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:flutter_marvel_infinity/presentation/cart/cart.dart';
import 'package:flutter_marvel_infinity/presentation/item_detail.dart/item_detail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../app_localizations.dart';
import '../../navigation_service.dart';

class ComicsGridItem extends StatelessWidget {
  final controller = GetIt.I.get<CartController>();
  final navigation = GetIt.I.get<NavigationService>();

  ComicsGridItem({
    @required this.item,
    Key key,
  })  : assert(item != null),
        super(key: key);
  final ComicsSummary item;

  @override
  Widget build(BuildContext context) => InkWell(
        highlightColor: Colors.redAccent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetail(
                    comicsSummary: item,
                  ),
                ));
            item.description == null
                ? Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .translate('store_msg_sem_informacoes'),
                    //toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0)
                : null;
          },
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
                    flex: 1,
                    child: Text(
                      item.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  item.images.isNotEmpty
                      ? Expanded(
                        flex: 2,
                          child: Image.network(
                            item.images[0].path + ".jpg",
                            height: 300,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 250,
                        ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                              "R\$ " +
                                  item.prices[0].price
                                      .toStringAsFixed(2)
                                      .toString(),
                              style: TextStyle(color: Colors.white)),
                        ),
                        InkWell(
                          onTap: () {
                            if (item.prices[0].price != 0.0) {
                              Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)
                                      .translate('store_msg_item_add'),
                                  //toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                              controller.addItemCart(item);
                            } else {
                              Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)
                                      .translate('detail_item_indisponivel')
                                  //AppLocalizations.of(context).translate('store_msg_item_add')
                                  ,
                                  //toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
