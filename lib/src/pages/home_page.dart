import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/src/models/band.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Foals', votes: 5),
    Band(id: '2', name: 'Queen', votes: 2),
    Band(id: '3', name: 'Zoe', votes: 3),
    Band(id: '4', name: 'Kinky', votes: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('BandNames', style: TextStyle( color: Colors.black87 )),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: ( context, i) =>_bandTile( bands[i] )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: addNewBand,
        elevation: 1,
      ),
    );
  }

  ListTile _bandTile( Band band ) {
    return ListTile(
          leading: CircleAvatar(
            child: Text( band.name.substring(0,2) ),
            backgroundColor: Colors.blue[100],
          ),
          title: Text( band.name ),
          trailing: Text( '${band.votes}', style: TextStyle(fontSize: 20.0)),
          onTap: () => print(band.name),
        );
  }

  addNewBand() {
    
    final textController = new TextEditingController();

    if (Platform.isAndroid){
      // Android
      return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Add New Band'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                textColor: Colors.blue,
                child: Text('Add'),
                elevation: 5,
                onPressed: () => addBandtoList( textController.text )
              ),
              MaterialButton(
                textColor: Colors.red,
                child: Text('Dimiss'),
                elevation: 5,
                onPressed: () => Navigator.pop(context)
              ),
            ],
          );
        }
      );
    }

    showCupertinoDialog(
      context: context, 
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text('New band name:'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => addBandtoList( textController.text ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Dimiss'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );

    
  }

  void addBandtoList(String name){
    print(name);

    if ( name.length > 1 ){
      // Agregamos banda
      this.bands.add( new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

  }
}