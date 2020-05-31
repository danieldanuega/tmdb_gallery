import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  final String author;
  final String content;

  ReviewTile({Key key, this.author, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.verified_user),
              ),
              title: Text(author),
            ),
            Divider(),
            Flexible(
              child: Text(content),
            ),
          ],
        ),
      ),
    );
  }
}
