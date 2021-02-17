import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_marvel_infinity/app_localizations.dart';
import 'package:flutter_marvel_infinity/controller/profile_controller.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

final controller = GetIt.I.get<ProfileController>();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [perfil(context), pedidos(context)],
        ),
      ),
    );
  }

  Widget perfil(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context).translate('title_profile'),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
          Text(AppLocalizations.of(context).translate('profile_nome')),
          Text(AppLocalizations.of(context).translate('profile_email')),
          Text(AppLocalizations.of(context).translate('profile_cpf')),
          Text(AppLocalizations.of(context).translate('profile_endereco')),
          Text(AppLocalizations.of(context).translate('profile_telefone')),
         
        ],
      ),
    );
  }

  Widget pedidos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context).translate('order_titulo'),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
          Observer(builder: (_) {
            return controller.listaPedido.length > 0
                ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listaPedido.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(AppLocalizations.of(context).translate('order_numero') + index.toString()),
                          
                          subtitle: Text(AppLocalizations.of(context).translate('order_total') +
                              controller.listaPedido[index].total.toString() +
                              "\n"+ AppLocalizations.of(context).translate('order_data')+
                              controller.listaPedido[index].data
                                  .toIso8601String())),
                    );
                  },
                )
                : Text(AppLocalizations.of(context).translate('order_pedidos_vazio'));
          })
        ],
      ),
    );
  }
}
