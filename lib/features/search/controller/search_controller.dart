import '../../../../exports.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchController, double>((ref) {
  return SearchController(0.0);
});

class SearchController extends StateNotifier<double> {
  SearchController(super.state);


}
