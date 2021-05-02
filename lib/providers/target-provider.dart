import 'package:flutter/material.dart';
import 'package:objective/models/target/target.dart';
import 'package:objective/services/target-service.dart';

class TargetProvider extends ChangeNotifier {
  List<Target> targets = [];
  List<Target> listDone = [];
  List<Target> listNotDone = [];

  Future<List<Target>> getTarget() async {
    var onValue = await TargetService.getTarget();
    targets = onValue;
    notifyListeners();
    return targets;
  }

  Future<List<Target>> getTargetDone() async {
    var onValue = await TargetService.getTarget();
    var targetsDone = onValue.where((target) => target.isDone == true).toList();
    listDone = targetsDone;
    notifyListeners();
    return listDone;
  }

  Future<List<Target>> getTargetNotDone() async {
    var onValue = await TargetService.getTarget();
    var targetsNotDone = onValue.where((target) => target.isDone == false).toList();
    listNotDone = targetsNotDone;
    notifyListeners();
    return listNotDone;
  }
}
