import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  List<int> unselectedlist = List.generate(50, (index) => index+1);

  List<int> selectedList = [];

  void removeFromUnselectedList(int index) {
    selectedList.add(unselectedlist[index]);
    unselectedlist.remove(unselectedlist[index]);
    unselectedlist.sort((a, b) => a.compareTo(b),);
    notifyListeners();
  }
  void removeFromSelectedList(int index) {
    unselectedlist.add(selectedList[index]);
    selectedList.remove(selectedList[index]);
    selectedList.sort((a, b) => a.compareTo(b));
    unselectedlist.sort((a, b) => a.compareTo(b),);
    notifyListeners();
  }
}