import 'package:flutter/material.dart';

import 'player.dart';

class PlayerCard extends StatelessWidget {
  @override
  final Player player;
  final Function delete;
  PlayerCard({this.player, this.delete});

  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                player.name,
                style: TextStyle(color: Colors.deepOrange[500], fontSize: 20.0),
              ),
            ),
            Text(
              player.title,
              style: TextStyle(fontSize: 16),
            ),
            FlatButton.icon(
                onPressed: delete,
                icon: Icon(Icons.delete),
                label: Text(
                  'Delete',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
