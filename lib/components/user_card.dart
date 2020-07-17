import 'package:flutter/material.dart';
import 'package:users_app/components/constants.dart';
import 'package:users_app/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function onPressed;

  UserCard({@required this.user, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(kSmallMargin),
          child: ListTile(
            leading: Hero(
              tag: kImageTag + user.id,
              child: Image(
                width: 72,
                image: NetworkImage(user.imageUrl),
              ),
            ),
            title: Hero(
                tag: kNameTag + user.id,
                child: Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 22, color: Colors.black87),
                )),
            subtitle:
                Hero(tag: kTaglineTag + user.id, child: Text(user.tagline, style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: 14
                ),)),
          ),
        ),
      ),
    );
  }
}
