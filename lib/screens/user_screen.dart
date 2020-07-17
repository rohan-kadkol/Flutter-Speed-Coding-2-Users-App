import 'package:flutter/material.dart';
import 'package:users_app/components/constants.dart';
import 'package:users_app/models.dart';

class UserScreen extends StatefulWidget {
  static final String routeName = '/users';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(kLargeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: kImageTag + user.id,
              child: Image(
                height: 150,
                image: NetworkImage(user.imageUrl),
              ),
            ),
            SizedBox(
              height: kLargeMargin,
            ),
            Hero(
              tag: kNameTag + user.id,
              child: Center(
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            SizedBox(
              height: kSmallMargin,
            ),
            Hero(
              tag: kTaglineTag + user.id,
              child: Center(
                child: Text(
                  user.tagline,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
