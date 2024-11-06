import 'package:flutter/cupertino.dart';
import 'package:todothirdtime/Models/todomodel.dart';
import 'package:todothirdtime/Models/todomodel.dart';
import 'package:todothirdtime/Services/todo_service.dart';
class TodoProvider extends ChangeNotifier{
  TodoModel? data;
  Future<void> gettAll() async{
    data = await TodoService.Get();
    notifyListeners();
  }
  Future<void> addTask(String todo)async{
    await TodoService.Adddata(todo:todo);
    data?.tasks.add({'todo':todo});
    data?.total +=1;
    notifyListeners();
  }
}