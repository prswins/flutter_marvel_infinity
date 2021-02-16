import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  List<ComicsSummary> listToBuy = List<ComicsSummary>();

  @action
  addItemCart(ComicsSummary item) {
    listToBuy.forEach((element) => element.id == item.id);
    listToBuy.add(item);
    listToBuy.forEach((element) {
      print(element.title);
    });
  }

  @action
  removeItemCart(int position) {
    listToBuy.removeAt(position);
  }
}

class ItemCarrinho extends ComicsSummary {
  int qtd = 1;
  String valor;
  ItemCarrinho({this.qtd, this.valor});
}
