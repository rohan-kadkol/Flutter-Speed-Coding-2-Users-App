import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_app/components/user_card.dart';
import 'package:users_app/models.dart';
import 'package:users_app/screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore _firestore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firestore = Firestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: _firestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                );
              }

              final users = snapshot.data.documents;
              List<UserCard> userWidgets = [];
              for (var user in users) {
                User userObject = User(
                    id: user.documentID,
                    name: user.data['name'],
                    tagline: user.data['tagline'],
                    imageUrl: user.data['imageUrl']);
                userWidgets.add(UserCard(
                  user: userObject,
                  onPressed: () {
                    Navigator.pushNamed(context, UserScreen.routeName,
                        arguments: userObject);
                  },
                ));
              }

              return Column(children: userWidgets);
            },
          )
        ],
      ),
    );
  }
}
