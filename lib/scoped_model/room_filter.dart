import 'package:flutter_application_2/scoped_model/data.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterBarModel extends Model {
  final List<GeneralType> _roomTypeList = [];
  final List<GeneralType> _orientedList = [];
  List<GeneralType> floorList = [];

  final Set<String> _selectedList = <String>{};

  Map<String, List<GeneralType>> get dataList {
    var result = <String, List<GeneralType>>{};
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['roomTypeList'] = floorList;
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    notifyListeners();
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListTroggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
  }

  @override
  notifyListeners();
}
