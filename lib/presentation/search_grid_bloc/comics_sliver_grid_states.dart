import 'package:flutter_marvel_infinity/comics_summary.dart';

class ComicsListingState {
  ComicsListingState({
    this.itemList,
    this.error,
    this.nextPageKey = 0,
  });

  final List<ComicsSummary> itemList;
  final dynamic error;
  final int nextPageKey;
}
