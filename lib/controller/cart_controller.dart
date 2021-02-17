import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  
  List<ItemCarrinho> itensCarrinho = List<ItemCarrinho>();

  @action
  addItemCart(ComicsSummary item) {
  
    ItemCarrinho ic = ItemCarrinho(item);
    if (itensCarrinho.isEmpty) {
      ic.qtd = 1;
      itensCarrinho.add(ic);
    } else {
      var retorno = itensCarrinho
          .indexWhere((item) => (item.comicsSummary.id == ic.comicsSummary.id));
      if (retorno == -1) {
        ic.qtd = 1;
        itensCarrinho.add(ic);
      } else {
        itensCarrinho[retorno].qtd++;
      }
    }
    itensCarrinho.forEach((element) {
      print(element.comicsSummary.title);
      print(element.qtd);
    });
  }

  @action
  removeItemCart(int position) {
    //listToBuy.removeAt(position);

    if (itensCarrinho[position].qtd == 1) {
      if (itensCarrinho.length == 1)
        itensCarrinho.removeAt(0);
      else
        itensCarrinho.removeAt(position);
    } else {
      itensCarrinho[position].qtd--;
    }
  }

  @action
  quickAddItemCart(int position) {
    itensCarrinho[position].qtd++;
  }

  @action
  double totalCarrinho() {
    int total = 0;
    itensCarrinho.forEach((element) {
      total = total + element.qtd;
    });
    return (total * 9.99);
  }

  @action
 PedidoFechado fecharPedido() {
    PedidoFechado pedido = new PedidoFechado(
        itens: itensCarrinho, total: totalCarrinho(), data: DateTime.now());
    itensCarrinho.clear();
    return pedido;
  }
}
