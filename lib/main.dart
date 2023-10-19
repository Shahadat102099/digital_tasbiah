import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),);
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Tasbiah"),
        centerTitle: true,
      ),

      body: Stack(
        fit: StackFit.expand,
        children: [
        Image.network(
        'https://shorturl.at/wABIL',
        fit: BoxFit.cover,
      ),
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$count",style: TextStyle(fontSize: 100),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      count = count-1;
                      setState(() {});
                    }, child: Icon(Icons.remove)),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      count++;
                      setState(() {});
                    }, child: Icon(Icons.add)),
                  ],
                )
              ],
            ),


        ),
      ],
      ),
    );
  }
}
