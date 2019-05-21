import 'package:flutter/material.dart';
import 'package:flutter_app/Networking/rest_api_manager.dart';
import 'package:flutter_app/Model/itunes_albums_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<Albums>(
      future: RestApiManager().fetchItunesAlbums(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              print(snapshot.data.feed.results[0].artistName);
            print("yugandharrrr");

            return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: futureBuilder,
    );
  }


  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              leading: Image(
                  image: new CachedNetworkImageProvider(
                      snapshot.data.feed.results[index].artworkUrl100)),
              title: new Text(snapshot.data.feed.results[index].artistName),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
