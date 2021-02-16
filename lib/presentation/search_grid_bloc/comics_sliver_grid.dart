import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:flutter_marvel_infinity/presentation/common/comic_search_input_sliver.dart';
import 'package:flutter_marvel_infinity/presentation/search_grid_bloc/comics_grid_item.dart';
import 'package:flutter_marvel_infinity/presentation/search_grid_bloc/comics_sliver_grid_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ComicsSliverGrid extends StatefulWidget {
  @override
  _ComicsSliverGridState createState() => _ComicsSliverGridState();
}

class _ComicsSliverGridState extends State<ComicsSliverGrid> {
  final ComicsSliverGridBloc _bloc = ComicsSliverGridBloc();
  final PagingController<int, ComicsSummary> _pagingController =
      PagingController(firstPageKey: 0);
  StreamSubscription _blocListingStateSubscription;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _bloc.onPageRequestSink.add(pageKey);
    });

    // We could've used StreamBuilder, but that would unnecessarily recreate
    // the entire [PagedSliverGrid] every time the state changes.
    // Instead, handling the subscription ourselves and updating only the
    // _pagingController is more efficient.
    _blocListingStateSubscription =
        _bloc.onNewListingState.listen((listingState) {
      _pagingController.value = PagingState(
        nextPageKey: listingState.nextPageKey,
        error: listingState.error,
        itemList: listingState.itemList,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          ComicSearchInputSliver(
            onChanged: (searchTerm) => _bloc.onSearchInputChangedSink.add(
              searchTerm,
            ),
          ),
          PagedSliverGrid<int, ComicsSummary>(
            pagingController: _pagingController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 100 / 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
            ),
            builderDelegate: PagedChildBuilderDelegate<ComicsSummary>(
              itemBuilder: (context, item, index) => ComicsGridItem(
                item: item,
              ),
            ),
          ),
        ],
      );

  @override
  void dispose() {
    _pagingController.dispose();
    _blocListingStateSubscription.cancel();
    _bloc.dispose();
    super.dispose();
  }
}
