import 'dart:async';
import 'package:flutter_marvel_infinity/presentation/search_grid_bloc/comics_sliver_grid_states.dart';
import 'package:flutter_marvel_infinity/remote_api.dart';
import 'package:rxdart/rxdart.dart';

class ComicsSliverGridBloc {
  ComicsSliverGridBloc() {
    _onPageRequest.stream
        .flatMap(_fetchCharacterSummaryList)
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);

    _onSearchInputChangedSubject.stream
        .flatMap((_) => _resetSearch())
        .listen(_onNewListingStateController.add)
        .addTo(_subscriptions);
  }

  static const _pageSize = 20;

  final _subscriptions = CompositeSubscription();

  final _onNewListingStateController =
      BehaviorSubject<ComicsListingState>.seeded(
    ComicsListingState(),
  );

  Stream<ComicsListingState> get onNewListingState =>
      _onNewListingStateController.stream;

  final _onPageRequest = StreamController<int>();

  Sink<int> get onPageRequestSink => _onPageRequest.sink;

  final _onSearchInputChangedSubject = BehaviorSubject<String>();

  Sink<String> get onSearchInputChangedSink =>
      _onSearchInputChangedSubject.sink;

  String get searchInputValue => _onSearchInputChangedSubject.value;

  Stream<ComicsListingState> _resetSearch() async* {
    yield ComicsListingState();
    yield* _fetchCharacterSummaryList(0);
  }

  Stream<ComicsListingState> _fetchCharacterSummaryList(int pageKey) async* {
    final lastListingState = _onNewListingStateController.value;
    try {
      final newItems = await RemoteApi.getCharacterList(
        pageKey,
        _pageSize,
        searchTerm: searchInputValue,
      );
      print("bloc");
      print(newItems);
      final isLastPage = newItems.length < _pageSize;
      final nextPageKey = isLastPage ? null : pageKey + newItems.length;
      yield ComicsListingState(
        error: null,
        nextPageKey: nextPageKey,
        itemList: [...lastListingState.itemList ?? [], ...newItems],
      );
    } catch (e) {
      print(e);
      yield ComicsListingState(
        error: e,
        nextPageKey: lastListingState.nextPageKey,
        itemList: lastListingState.itemList,
      );
    }
  }

  void dispose() {
    _onSearchInputChangedSubject.close();
    _onNewListingStateController.close();
    _subscriptions.dispose();
    _onPageRequest.close();
  }
}
