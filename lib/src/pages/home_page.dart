import 'package:band_names/src/models/band.dart';
import 'package:flutter/material.dart';

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
        onPressed: (){},
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
          onTap: (){
            print( band.name ); 
          },
        );
  }
}