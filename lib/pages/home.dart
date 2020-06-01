import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasaapp/pages/login.dart';
import 'package:nasaapp/pages/right.dart';
import 'package:nasaapp/pages/left.dart';
import 'package:nasaapp/pages/center.dart';

class Home extends StatefulWidget {
  final int index;

  const Home({ Key key, this.index}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: widget.index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.green
            ),
            child :

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.nature_people),
                Text('OutDoorsy', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
          tag: 'Hero1',

        ),
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()
                  )
              );
            },
          ),

        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            LeftPage(),
            CenterPage(),
            RightPage(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black12,
          unselectedLabelColor: Colors.black38,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.wb_sunny),
              child: Text(
                  'Environment'
              ),
            ),
            Tab(
              icon: Icon(Icons.format_list_bulleted),
              child: Text(
                  'Feed'
              ),
            ),
            Tab(
              icon: Icon(Icons.camera_alt),
              child: Text(
                  'Identifier'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
