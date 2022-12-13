import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetail{
  String name;
  int msgCount;
  
  ListDetail(this.name, this.msgCount);
}
class ListDetailView extends StatelessWidget{
  final ListDetail listDetail;
  const ListDetailView({Key? key, required this.listDetail }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : const Text("상세화면")
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("이름 : ${listDetail.name}"),
            Text("메세지 카운트 : ${listDetail.msgCount}"),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'ok');
              },
              child: const Text('이전 페이지로'),
            )
          ],
        ),
      )
    );
  }
}
