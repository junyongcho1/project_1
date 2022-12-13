import 'package:flutter/material.dart';

class DataManager extends StatefulWidget{
  @override
  DataManagerState createState() => DataManagerState();
}

class DataManagerState extends State<DataManager> {
  final List<String> names = <String>['배주현','강슬기','손승완'];
  final List<int> msgCount = <int>[2,0,10];
  TextEditingController nameController = TextEditingController();
  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
      msgCount.insert(0,0);
    });
  }
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text('리스트 에디터 추가'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText:'Contact Name',
            ),
          ),
        ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: (){
                addItemToList();
              },
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context,int index) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.all(2),
                      color: msgCount[index]>=10? Colors.blue[100]: Colors.grey,
                      child: Center(
                        child: Text('${names[index]} (${msgCount[index]})',
                        style:  const TextStyle(fontSize:18),
                  )
                ),
              );
            }
          ),
        )
      ]
    ),
  );
}
}