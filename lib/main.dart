import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  var pics = [
    "https://cdn.pixabay.com/photo/2016/02/19/11/36/motherhood-1209814_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/17/14/08/landscape-4701725_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/14/09/22/landscape-4694558_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/17/17/58/night-4702174_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/15/53/landscape-4706445_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/16/19/24/parrot-4700043_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/02/03/55/the-occasion-of-christmas-4666860_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/17/14/43/illustration-4701783_1280.png",
    "https://cdn.pixabay.com/photo/2019/12/15/22/25/winter-4698123_1280.jpg",
    "https://cdn.pixabay.com/photo/2019/12/18/06/49/sky-4703209_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Container(
          child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: pics.length,
        itemBuilder: (BuildContext context, int index) => new Material(
          elevation: 8.0,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(
                  pic: pics[index],
                ),
              ),
            ),
            child: FadeInImage(
              image: NetworkImage(pics[index]),
              fit: BoxFit.cover,
              placeholder: AssetImage("assets/images/placeholder.png"),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      )),
    );
  }
}

class Detail extends StatelessWidget {
  final String pic;
  Detail({this.pic});
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: Text("Download"),
          ),
          BottomNavigationBarItem(
            title: Text("Apply"),
            icon: Icon(Icons.format_paint),
          ),
          BottomNavigationBarItem(
            title: Text("Share"),
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: y,
            height: x,
            child: Image.network(
              pic,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 8.0,
            top: 30.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Basic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
