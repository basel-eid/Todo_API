import 'package:dio/dio.dart';
import 'package:todothirdtime/Models/todomodel.dart';
import 'package:todothirdtime/Models/todomodel.dart';
class TodoService{
  static final dio = Dio();
  static Map AddData = {'todo':"",'completed':false,'userId':5};
  static Future<TodoModel> Get()async{
    const url ="https://dummyjson.com/todos";
    Response response = await dio.get(url);
    return TodoModel.fromjson(response.data);
  }
  static Future<void> Adddata({required String todo}) async{
    AddData['todo'] = todo;
    await dio.post(
        'https://dummyjson.com/todos/add',
        data: AddData

    );
  }

}