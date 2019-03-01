import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget{

  @override
  _BottomNavBarState createState() => new _BottomNavBarState();
  
  
  }
  
  class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  int _currentIndex;
  final List<Widget> _pages = [
  ];
  
  //Construye la barra de navegacion inferior
  void onTabTapped(int index){
  setState(() {
   _currentIndex= index;
  });
}


  Widget _builBottomBar(){
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Colors.transparent,
      textTheme: Theme.of(context).textTheme.copyWith(caption: new TextStyle(color: Colors.black54))
    ),
    child:  BottomNavigationBar(
      onTap: onTabTapped,
      fixedColor: Colors.blue[900],
      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),  
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Messages'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile')
        )
      ],
    ),
  );
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _builBottomBar(),
    );
  }
}