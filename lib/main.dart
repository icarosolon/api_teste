import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/Post.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<Post> post;
  MyApp({
    Key key,
    this.post,
  }) : super(
          key: key,
        );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(
        post: post,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Future<Post> post;
  HomePage({@required this.post});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Post>> _getPost() async {
    final response =
        await http.get('http://192.168.100.13/MeuProjeto/public/api/mcf');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      List<Post> posts = [];

      for (var u in jsonData) {
        Post post = Post(
          u["id"],
          u["nome"],
          u["dt_nasc"],
          u["sexo"],
          u["created_at"],
          u["updated_at"],
        );
        posts.add(post);
      }

      //print(posts.length);
      return posts;
      //return jsonData;
      //return Post.fromJson(json.decode(response.body)[1]);
    } else {
      throw Exception('Falha ao carregar um post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumindo API'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              final f = new DateFormat('yyyy-MM-dd hh:mm');
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://image.freepik.com/vetores-gratis/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg"),
                    ),
                    title: Text(
                      snapshot.data[index].nome,
                    ),
                    subtitle: Text(new DateFormat("dd/MM/yyyy", "en_US")
                        .format(DateTime.parse(snapshot.data[index].dtNasc))),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
