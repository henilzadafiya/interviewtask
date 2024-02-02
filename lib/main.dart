import 'package:flutter/material.dart';
import 'package:interviewtask/MyProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("InterView Task"),
      ),
      body: Column(
        children: [
          Text("Unselected List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      myProvider.removeFromUnselectedList(index);
                    },
                    title: Text("${myProvider.unselectedlist[index]}"),
                    trailing: Icon(Icons.delete),
                  );
                },
                itemCount: myProvider.unselectedlist.length,
              ),),
          Text("Selected List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      myProvider.removeFromSelectedList(index);
                    },
                    title: Text("${myProvider.selectedList[index]}"),
                    trailing: Icon(Icons.delete),
                  );
                },
                itemCount: myProvider.selectedList.length,
              )),
        ],
      ),
    );
  }
}

