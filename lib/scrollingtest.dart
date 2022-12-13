import 'package:flutter/cupertino.dart';
//별도의 창을 생성시:stateless,statefull결정
import 'package:flutter/material.dart';
class MyScrollableWidget extends StatelessWidget{
  const MyScrollableWidget({super.key});//상위클래스 일치시키기 위해

  @override
  Widget build(BuildContext context){//그래픽 출력
    return DefaultTextStyle( //하위 위젯이 가져야하는 글꼴을 전체적으로 지정
      style: const TextStyle(fontSize: 36,color: Colors.blue),//const Theme.of(context).textTheme.bodyMedium,
      child: LayoutBuilder(//뷰포트 정보를 전달해주는 위젯
        builder: (BuildContext context, BoxConstraints viewportConstraints){//화면 제약사항
          return SingleChildScrollView(//스크롤 가능하게 하는 위젯->여러 객체에 대해서 스코롤이 가능하도록 공통객체를 만들어 놓음
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(//세로로 여러개를 나열하겠다
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: const Color(0xffeeee00),
                      height:520.0,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text('상위 컨테이너'),
                          ElevatedButton(
                      child: const Text('이전페이지'),
                      onPressed:(){
                      Navigator.pop(context);
                            },
                          ),
                        ]
                      ),
                    ),
                    Container(
                      color: const Color(0xff008000),
                      height:520.0,
                      alignment: Alignment.center,
                      child: const Text('하위 컨테이너'),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}