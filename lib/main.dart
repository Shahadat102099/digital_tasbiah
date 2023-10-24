import 'package:digital_tasbiah/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do App",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),

      home: HomePage(),);
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TodoList= [];
  String Item ="";
  MyInputOnChange(content){
    Item = content;
  }
  AddItem(){
    setState(() {
      TodoList.add({"Item": Item});
    });
  }
  DeleteItem(index){
    setState(() {
      TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO-Do-APP"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:68,
                        child: TextFormField(onChanged:(content){MyInputOnChange(content);}, decoration: AppInputDecoration("Enter List"),)),
                    Expanded(
                      flex: 1,
                        child:SizedBox() ),

                    Expanded(flex:31,
                        child: ElevatedButton.icon(onPressed: (){AddItem();}, icon: Icon(Icons.add), label: Text("Add"), style: AppButtonStyle(),)),
                  ],

            )),
            SizedBox(height: 20,),
            Expanded(
                flex: 85,
                child: ListView.builder(
                    itemCount: TodoList.length,
                    itemBuilder: (context, index){
                      return Card(

                        child: Sizebox50(
                          Row(
                            children: [
                              Expanded(
                                  flex:80,
                                  child: Text(TodoList[index]['Item'].toString())),
                              Expanded(
                                  flex: 20,
                                  child: ElevatedButton(onPressed: (){DeleteItem(index);},child: Icon(Icons.delete),)),
                            ],
                          )
                        ),

                      );
                    }
                    )
            )
          ],
        ),
      ),
    );
  }
}
