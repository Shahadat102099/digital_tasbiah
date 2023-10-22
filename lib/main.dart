
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(),);
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _fieldoneTEcontroller = TextEditingController();
  TextEditingController _fieldtwoTEcontroller = TextEditingController();
  GlobalKey <FormState> _formkey = GlobalKey<FormState>();

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mathematics Operation"),
          centerTitle: true,
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _fieldoneTEcontroller,
                    decoration: const InputDecoration(
                      label: Text("Enter First Number"),
                    ),
                    validator: (String ? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Valid Value";
                      }
                      return null;
                    }
                ),
                TextFormField(
                  controller: _fieldtwoTEcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter Second Number"),
                  ),
                  validator: (String ? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Valid Value";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldoneTEcontroller
                            .text.trim());
                        double secondNumber = double.parse(_fieldtwoTEcontroller
                            .text.trim());
                        result = firstNumber + secondNumber;
                        setState(() {});
                      }
                    }, icon: Icon(Icons.add), label: Text("Add"),),
                    const SizedBox(width: 10,),
                    ElevatedButton.icon(onPressed: (){
                      if (_formkey.currentState!.validate()) {
                      double firstNumber = double.parse(_fieldoneTEcontroller
                          .text.trim());
                      double secondNumber = double.parse(_fieldtwoTEcontroller
                          .text.trim());
                      result = firstNumber - secondNumber;
                      setState(() {});
                    }


                    }, icon: const Icon(Icons.remove),label: Text("Sub"),),

                    const SizedBox(width: 10,),
                    ElevatedButton.icon(onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldoneTEcontroller
                            .text.trim());
                        double secondNumber = double.parse(_fieldtwoTEcontroller
                            .text.trim());
                        result = firstNumber * secondNumber;
                        setState(() {});
                      }


                    }, icon: const Icon(Icons.star),label: const Text("Multiply"),)
                  ],
                ),
                Text("Result is: $result", style: TextStyle(fontSize: 40,),),
              ],
            ),
          ),
        )
    );
  }
}

