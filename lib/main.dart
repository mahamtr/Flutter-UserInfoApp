import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'PlayerCard.dart';
import 'player.dart';

Color mainColor = Color(0xff1c2630);
Color secColor = Color(0xff0aa89e);
int loginAttempts = 0;

void main() => runApp(MaterialApp(home: UserList()));

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var faker = new Faker();

  List<Player> players = [
    Player(name: 'Roger', title: "Doctor"),
    Player(name: 'Megan', title: "Cyclist"),
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

  void addPlayer() {
    setState(() {
      players.add(
          Player(name: faker.person.name(), title: faker.address.country()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(fontFamily: 'Manrope', fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 90.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: players
              .map((player) => PlayerCard(
                    player: player,
                    delete: () {
                      this.delete(player);
                    },
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[500],
        child: Icon(Icons.add),
        onPressed: () {
          this.addPlayer();
        },
      ),
    );
  }
}
