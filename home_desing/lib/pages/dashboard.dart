import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui' as ui;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
    }
  
  class _DashboardState extends State<Dashboard> with TickerProviderStateMixin{
    
//Shadow of containers
  BoxDecoration _buildShadowAndRoundedCorners(){
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: 4.0,
          blurRadius: 10.0,
          color: Colors.black26
        )
      ]
    );
  }

  //Card item
  Widget myItems(IconData icon, String title, Color color){
      return Container(
        decoration: _buildShadowAndRoundedCorners(),
        child: Material(
          color: Colors.white.withOpacity(0.4),
          elevation: 12.0,
          shadowColor: Colors.black54,
          borderRadius: BorderRadius.circular(12.0),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(child: _buildColumn(title, icon, color), flex: 1, fit: FlexFit.tight,)
                ],
              ),
            ),
        ),
      );
    }
//Construye el texto
    Widget _buildText(String title){
      return 
      Center(
        child: Text(
          title,
          style:TextStyle(
          color: Colors.blueAccent,
          fontSize: 16.0,
          ),
        ),
      );
    }

    Widget _buildIcon(IconData icon, Color color){
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30.0,
            ),
          ),
        ),
      );
    }

    Widget _buildColumn(String title, IconData icon, Color color){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        //Text
        Flexible(child: _buildText(title), flex: 1, fit: FlexFit.loose),
        //Icon
        Flexible(child: _buildIcon(icon, color), flex: 2, fit: FlexFit.loose)
        ],
      );
    }

    Widget _buildContent(){
      return StaggeredGridView.count(

        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal:16.0),
        children: <Widget>[
          myItems(Icons.account_balance, 'Balance de Cuenta', Colors.blueAccent),
          myItems(Icons.account_balance_wallet, 'Balance de Cartera', Colors.blueAccent),
          myItems(Icons.attach_money, 'Balance de Inversion', Colors.blueAccent),
          myItems(Icons.desktop_windows, 'Sistema', Colors.blueAccent),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
        ],
      );
    }


  
  
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/bg_sgb.jpg',
              fit: BoxFit.cover
              ),
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              _buildContent(),
          ],
        )
      );
    }

}