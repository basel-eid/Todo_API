class TodoModel{
  List<dynamic> tasks;
  int total ;
  TodoModel({required this.tasks , required this.total});
  factory TodoModel.fromjson(Map<String,dynamic> json){
    return TodoModel(tasks: json['todos'],total: json['total']);
  }
}