import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  @observable
  List<PedidoFechado> listaPedido = List<PedidoFechado>();

  @action
  addItemPedido(PedidoFechado pedido) {
    listaPedido.add(pedido);
  }
}
