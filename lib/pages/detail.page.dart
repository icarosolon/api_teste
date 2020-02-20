import 'package:api_flutter/models/Post.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Post post;

  DetailPage(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://image.freepik.com/vetores-gratis/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg"),
          ),
        ),
        title: Text(post.nome),
      ),
    );
  }
}
