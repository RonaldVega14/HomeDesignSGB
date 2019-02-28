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
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          highlightColor: color,
          onTap: (){},
          child: Container(
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
          ),
      ),
    ); 
  }
//Construye el texto
    Widget _buildText(String title, Color color){
      return Center(
        child: Text(
          title,
          style:TextStyle(
          color: color,
          fontSize: 18.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w800,
          ),
        ),
      );
    }
//Construye el icono
    Widget _buildIcon(IconData icon, Color color){
      return Material(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(50.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: MediaQuery.of(context).size.height*0.07,
            ),
          ),
       ); 
    }
//Construye las columnas
    Widget _buildColumn(String title, IconData icon, Color color){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        //Icon
        Flexible(child: _buildIcon(icon, color), flex: 3, fit: FlexFit.loose),
        //Text
        Flexible(child: _buildText(title, color), flex: 1, fit: FlexFit.loose),
        ],
      );
    }
//Junta y construye todo el contenido
    Widget _buildContent(){
      return StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal:16.0),
        children: <Widget>[
          Container(color: Colors.transparent),
          myItems(Icons.account_balance, 'Balance de Cuenta', Colors.blue[900]),
          myItems(Icons.account_balance_wallet, 'Balance de Cartera', Colors.blue[900]),
          myItems(Icons.attach_money, 'Balance de Inversion', Colors.blue[900]),
          myItems(Icons.desktop_windows, 'Sistema', Colors.blue[900]),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, MediaQuery.of(context).size.height*0.20),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
          StaggeredTile.extent(1, MediaQuery.of(context).size.height*0.25),
        ],
      );
    }

   @override
    Widget build(BuildContext context) {
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