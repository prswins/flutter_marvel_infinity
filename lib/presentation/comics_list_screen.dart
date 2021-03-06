import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_marvel_infinity/presentation/cart/cart.dart';
import 'package:flutter_marvel_infinity/presentation/profile/profile.dart';
import 'package:flutter_marvel_infinity/presentation/search_grid_bloc/comics_sliver_grid.dart';

import '../app_localizations.dart';

class ComicsListScreen extends StatefulWidget {
  @override
  _ComicsListScreenState createState() => _ComicsListScreenState();
}

class _ComicsListScreenState extends State<ComicsListScreen> {
  int _selectedBottomNavigationIndex = 0;

  final List<_BottomNavigationItem> _bottomNavigationItems = [
    _BottomNavigationItem(
      label: 'toolbar_item_perfil',
      iconData: Icons.person,
      widgetBuilder: (context) => Profile(),
    ),
    _BottomNavigationItem(
      label: 'toolbar_item_loja',
      iconData: Icons.my_library_books_sharp,
      widgetBuilder: (context) => ComicsSliverGrid(),
    ),
    _BottomNavigationItem(
      label: 'toolbar_item_carrinho',
      iconData: Icons.shopping_cart,
      widgetBuilder: (context) => Cart(),
    ),
    
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(child:  Text(AppLocalizations.of(context).translate('titulo_loja'))),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedBottomNavigationIndex,
          items: _bottomNavigationItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.iconData, size: 45,),
                  label: AppLocalizations.of(context).translate(item.label),
                ),
              )
              .toList(),
          onTap: (newIndex) => setState(
            () => _selectedBottomNavigationIndex = newIndex,
          ),
        ),
        body: IndexedStack(
          index: _selectedBottomNavigationIndex,
          children: _bottomNavigationItems
              .map(
                (item) => item.widgetBuilder(context),
              )
              .toList(),
        ),
      );


      
}

class _BottomNavigationItem {
  const _BottomNavigationItem({
    @required this.label,
    @required this.iconData,
    @required this.widgetBuilder,
  })  : assert(label != null),
        assert(iconData != null),
        assert(widgetBuilder != null);

  final String label;
  final IconData iconData;
  final WidgetBuilder widgetBuilder;
}
