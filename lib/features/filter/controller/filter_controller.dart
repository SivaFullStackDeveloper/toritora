import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toritora/constant/constant_strings.dart';

import '../../../exports.dart';

final filterControllerProvider =
    ChangeNotifierProvider<FilterController>((ref) {
  return FilterController();
});

class FilterController extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  List<String> selected = [];
  List<String> filteredList = [];
  var start = 1.0;
  var end = 20.0;
  var items = [
    'hokkaido',
    'aomori',
    'iwate',
    'miyagi',
    'akita',
    'yamagata',
    'fukushima',
    'ibaraki',
    'tochigi',
    'gunma',
    'saitama',
    'chiba',
    'tokyo',
    'kanagawa',
    'niigata',
    'toyama',
    'ishikawa',
    'fukui',
    'yamanashi',
    'nagano',
    'gifu',
    'shizuoka',
    'aichi',
    'mie',
    'shiga',
    'kyoto',
    'osaka',
    'hyogo',
    'nara',
    'wakayama',
    'tottori',
    'shimane',
    'okayama',
    'hiroshima',
    'yamaguchi',
    'tokushima',
    'kagawa',
    'ehime',
    'kochi',
    'fukuoka',
    'saga',
    'nagasaki',
    'kumamoto',
    'oita',
    'miyazaki',
    'kagoshima',
    'okinawa',
  ];

  var filterItemList = [];

  genreFunction(value) {
    if (filterItemList.contains(value)) {
      filterItemList.remove(value);
      notifyListeners();
    } else {
      filterItemList.add(value);
      notifyListeners();
    }
  }

  changeDate(picked) {
    selectedDate = picked;
    notifyListeners();
    KString.selectDate =
        '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
    notifyListeners();
  }

  selectCityFunction(value) {
    if (selected.contains(value)) {
      print(selected.toString());
      selected.remove(value);
      notifyListeners();
    } else if (selected.length < 3) {
      selected.add(value);
      notifyListeners();
      print(selected.toString());
    }
  }


  addList(){
    filterItemList = items;
    notifyListeners();
  }

  searchCity(String keyWord){
    filterItemList = items.where((items) => items.toLowerCase().contains(keyWord.toLowerCase())).toList();
    print(filterItemList);
    notifyListeners();
  }

  updateRange(value) {
    start = value;
    notifyListeners();
  }

  updateEnd(value) {
    end = value;
    notifyListeners();
  }

  clear() {
    selected.clear();
    updateRange(1.0);
    updateEnd(20.0);
    filterItemList.clear();
    KString.selectDate = 'Select Date';
    notifyListeners();
  }
}
