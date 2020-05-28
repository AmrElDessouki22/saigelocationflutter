import 'package:flutter/material.dart';
import 'HttptoOurServer.dart';

void main() => runApp(Sai());
class Sai extends StatefulWidget {
  @override
  _SaiState createState() => _SaiState();
}

class _SaiState extends State<Sai> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home: Scaffold(body: SafeArea(
              child: Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
            future: getnearest({},[]),
            builder: (context,res)
          {
            switch(res.connectionState)
            {
              
              case ConnectionState.none:
                return Container(child: Text('loading'),alignment: Alignment.center,);
              case ConnectionState.waiting:
               return Container(child: Text('loading'),alignment: Alignment.center,);
              case ConnectionState.active:
                return Container(child: Text('loading'),alignment: Alignment.center,);
              case ConnectionState.done:
                return Container(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('nearest user to you (uid) : ',style: TextStyle(fontSize: 20),),
                    Text(res.data['TokenFromFirebaseOrUID'],style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Text('distance from him : ',style: TextStyle(fontSize: 20),),
                    Text(res.data['distance']['distance']+' '+res.data['distance']['unit'],style: TextStyle(fontSize: 20),),
                  ],
                ));
            }
          },),
        ),
      ),),
      
    );
  }
}

