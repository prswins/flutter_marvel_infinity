// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  final _$listToBuyAtom = Atom(name: '_CartControllerBase.listToBuy');

  @override
  List<ComicsSummary> get listToBuy {
    _$listToBuyAtom.reportRead();
    return super.listToBuy;
  }

  @override
  set listToBuy(List<ComicsSummary> value) {
    _$listToBuyAtom.reportWrite(value, super.listToBuy, () {
      super.listToBuy = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  dynamic addItemCart(ComicsSummary item) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addItemCart');
    try {
      return super.addItemCart(item);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItemCart(int position) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeItemCart');
    try {
      return super.removeItemCart(position);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listToBuy: ${listToBuy}
    ''';
  }
}
