import 'package:flutter/material.dart';
import 'player.dart';
import 'PlayerCard.dart';

Color mainColor = Color(0xff1c2630);
Color secColor = Color(0xff0aa89e);
int loginAttempts = 0;

void main() => runApp(MaterialApp(home: NinjaId()));

class NinjaId extends StatefulWidget {
  @override
  _NinjaIdState createState() => _NinjaIdState();
}

class _NinjaIdState extends State<NinjaId> {
  int ninjaLevel = 0;
  List<Player> players = [
    Player(name: 'Maai', level: 16),
    Player(name: 'Megan', level: 32),
    Player(name: 'Roger', level: 10),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void delete(player) {
    setState(() {
      players.remove(player);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'Ninjas List',
          style: TextStyle(fontFamily: 'Manrope'),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 90.0,
      ),
      body: Column(
        children: players
            .map((player) => PlayerCard(
                  player: player,
                  delete: () {
                  this.delete(player);
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[500],
        child: Icon(Icons.add),
        onPressed: (){
          players.add(Player(name: 'asdf',level: 24));
        },
      ),
    );
  }
}
