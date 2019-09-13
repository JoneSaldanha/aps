import 'package:flutter/material.dart';
import 'package:pet/ui/login.dart';


final Color backgroundColor = Color (0xFFffffff);



class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  void logout(){

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => Login()),
    );

  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

//                Text("Dashboard", style: TextStyle(color: Colors.purple, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Messages", style: TextStyle(color: Colors.purple, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Utility Bills", style: TextStyle(color: Colors.purple, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Funds Transfer", style: TextStyle(color: Colors.purple, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Logout", style: TextStyle(color: Colors.purple, fontSize: 22)),
//                FlatButton(child:
//                  Container(
//
//                      child: Text("Logout",textAlign: TextAlign.left, )),
//                  onPressed: logout,
//
//                )
//                  Row(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(right: 0),
//                            child: IconButton(
//                              icon: Icon(Icons.arrow_back),
//                              tooltip: 'Increase volume by 10',
//
//                            ),
//                          ),
//                        ],
//                      ),
//                      FlatButton(child:
//                            Text("Logout"),
//                            onPressed: logout,
//
//                        )
//
//                    ],
//
//                  ),
                Container(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back ),
                      color: Colors.white,
                      onPressed: logout
                )
                  )
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.purple),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("Meus Pets", style: TextStyle(fontSize: 24, color: Colors.purple)),
                      Icon(Icons.settings, color: Colors.purple),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
//                      Container(
//                        color: Colors.blue,
//                        height: 50.0,
//                        width: 50.0,
//                      ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.add_a_photo, size: 30.0, color: Colors.pink),
                        ),
                        Icon(Icons.warning, size: 30.0, color: Colors.purple,),
//                      Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
//                      Container(
//                        color: Colors.orange,
//                        height: 50.0,
//                        width: 50.0,
//                      ),
//                      Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
                      ],



//                    children: <Widget>[
//                    Text("Bob"),
//                    RaisedButton(child:
//                    Icon(Icons.add_a_photo, color: Colors.purple),),
//                    RaisedButton(child:
//                    Icon(Icons.warning, color: Colors.purple, ),)
//                  ],
),
                  ),

                  Container(
                    color: Colors.white,
                    height: 200,
                    child:
                        PageView(
                          controller: PageController(viewportFraction: 0.8),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: 80,
                              child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.asset("imgs/pet01.jpg",fit: BoxFit.cover,),
                              width: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                              width: 100,
                            ),
                          ],
                        ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
    //                      Container(
    //                        color: Colors.blue,
    //                        height: 50.0,
    //                        width: 50.0,
    //                      ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.add_a_photo, size: 30.0, color: Colors.pink),
                        ),
                        Icon(Icons.warning, size: 30.0, color: Colors.purple,),
    //                      Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
    //                      Container(
    //                        color: Colors.orange,
    //                        height: 50.0,
    //                        width: 50.0,
    //                      ),
    //                      Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
                      ],
                    ),
                  ),

                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 50,
                          child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset("imgs/pet01.jpg",fit: BoxFit.cover,),
                          width: 80,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                          width: 80,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        //                      Container(
                        //                        color: Colors.blue,
                        //                        height: 50.0,
                        //                        width: 50.0,
                        //                      ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.add_a_photo, size: 30.0, color: Colors.pink),
                        ),
                        Icon(Icons.warning, size: 30.0, color: Colors.purple,),
                        //                      Icon(Icons.adjust, size: 50.0, color: Colors.greenAccent,),
                        //                      Container(
                        //                        color: Colors.orange,
                        //                        height: 50.0,
                        //                        width: 50.0,
                        //                      ),
                        //                      Icon(Icons.adjust, size: 50.0, color: Colors.cyan,),
                      ],
                    ),
                  ),

                  Container(
                    height: 150,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 80,
                          child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset("imgs/pet01.jpg",fit: BoxFit.cover,),
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset("imgs/pet00.jpg",fit: BoxFit.cover,),
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Ações", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(""),
                          subtitle: Text(""),
                          trailing: Text(""),
                        );
                      }, separatorBuilder: (context, index) {
                    return Divider(height: 16);
                  }, itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}