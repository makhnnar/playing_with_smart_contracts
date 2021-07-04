import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TodoListModel.dart';

class NFTItem extends StatelessWidget {

  final Task item;

  NFTItem(
      this.item
  );

  TodoListModel _listModel;

  @override
  Widget build(BuildContext context) {
    _listModel = Provider.of<TodoListModel>(context);
    return InkWell(
      onTap: () {
        _askedToTransfer(context);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: 4.0,
            left: 4.0,
            right: 4.0,
            bottom: 4.0
        ),
        height: 80.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFc8d2e3),
                  Color(0xFFafb7c4)
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child:Row(
          children: [
            Text("id: ${item.id} "),
            Text(" token: ${item.taskName}")
          ],
        ),
      ),
    );
  }

  Future<void> _askedToTransfer(BuildContext context) async {
    var myController = TextEditingController();
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Write your receiver address:'),
            children: <Widget>[
              TextField(
                controller: myController,
              ),
              SimpleDialogOption(
                onPressed: () {
                  print(myController.text);
                  _listModel.transfer(
                      "0x750A04854a99C4c5DD4143485C1ccec854c15E17",//myController.text,
                      item.id
                  );
                  myController = null;
                  Navigator.pop(context);
                },
                child: const Text('Send'),
              ),
            ],
          );
        }
    );
  }

}