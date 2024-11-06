import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/todo_provider.dart';
import '../Widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? Mytext;
    var ob = Provider.of<TodoProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check,size: 30,color: Colors.white,),
                Text("ToDayDo",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
            Consumer<TodoProvider>(builder: (context, value, child) {
              final total = value.data?.total;
              return Text("$total Tasks",style: TextStyle(fontSize: 15,color: Colors.white),);
            },),
            SizedBox(height: 10,),
            Expanded(child: Container(
              height: 250,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: Consumer<TodoProvider>(builder: (context, value, child) {
                final tasks = value.data?.tasks;
                if(tasks == null){
                  value.gettAll();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                  return ListView.builder(itemCount: tasks.length,itemBuilder: (context, index) {
                   return TodoTile(
                      taskTitle: tasks[index]["todo"],
                    );
                  },);
                }
              },),
            ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),hoverColor: Colors.greenAccent,onPressed: () {
        showModalBottomSheet(builder: (context){
          return Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30),
                child: Text("Add Task"),),
                Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                    onChanged: (newText) {
                      Mytext = newText;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                  height: 50,
                  child: MaterialButton(onPressed: () {
                    if (Mytext?.trim() != '') {
                      ob.addTask(Mytext!);
                    }
                    Navigator.pop(context);
                  },child: Text("Add"),color: Colors.greenAccent),
                )
              ],
            ),
          );
        },isScrollControlled: true,context: context);
      },),


    );

  }
}
