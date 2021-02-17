// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$listaPedidoAtom = Atom(name: '_ProfileControllerBase.listaPedido');

  @override
  List<PedidoFechado> get listaPedido {
    _$listaPedidoAtom.reportRead();
    return super.listaPedido;
  }

  @override
  set listaPedido(List<PedidoFechado> value) {
    _$listaPedidoAtom.reportWrite(value, super.listaPedido, () {
      super.listaPedido = value;
    });
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  dynamic addItemPedido(PedidoFechado pedido) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.addItemPedido');
    try {
      return super.addItemPedido(pedido);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaPedido: ${listaPedido}
    ''';
  }
}
