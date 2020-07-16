import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
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
//                print('1');
//                print(user.data);
//                print('2');
                print('START');
                final name = user.data['name'];
                final tagline = user.data['tagline'];
                final imageUrl = user.data['imageUrl'];
                final userWidget = UserCard(
                  name: name,
                  tagline: tagline,
                  imageUrl: imageUrl,
                );
                print(userWidget.name);
                print(userWidget.tagline);
                print(userWidget.imageUrl);
                print('END');
                userWidgets.add(userWidget);
              }

              return Column(children: userWidgets);
            },
          )
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String tagline;
  final String imageUrl;

  UserCard({this.name, this.tagline, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          imageUrl,
        ),
        title: Text(name),
        subtitle: Text(tagline),
      ),
    );
  }
}
