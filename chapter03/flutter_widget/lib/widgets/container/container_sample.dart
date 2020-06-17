import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
        child: Container(
          height: 200.0,  // 容器高度
          width: 200.0,   // 容器宽度
//          color: Colors.green, // 容器颜色
          margin: EdgeInsets.all(5.0),  // 容器外边距
          padding: EdgeInsets.all(5.0),  // 容器内边距
          alignment: Alignment.center,  // 子控件对齐方式
          decoration: BoxDecoration(
//            shape: BoxShape.circle,   // 圆形容器
            borderRadius: new BorderRadius.circular(20.0), // 圆角弧度
            color: Colors.green, // 容器颜色
            boxShadow: [
              new BoxShadow(
                color: Color(0xFF999999),
                offset: new Offset(20.0, 10.0),
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 0.0),
              colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)],
              tileMode:
                  TileMode.repeated, // 在 end 后重复展示渐变效果
            ),
          ),

          child: Text('Hello', style: TextStyle(fontSize: 40.0),),
        ),
      ),
    );
  }
}

/*
* TODO Container containing Flutter Flutter
*
* Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(25.0),
        decoration: FlutterLogoDecoration(),
      ),
*
* */

/*
* TODO Container with ShapeDecoration (Red Border and Shadow)
*
* Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(25.0),
        decoration: new ShapeDecoration(
          color: Colors.white,
          shadows: <BoxShadow>[
            BoxShadow(color: Colors.black, blurRadius: 15.0)
          ],
          shape: new Border.all(
            color: Colors.red,
            width: 8.0,
          ),
        ),
        child: Center(child: const Text('Hello Flutter', textAlign: TextAlign.center)),
      ),
* */

/*
*  TODO Rounded Container
*
*  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(25.0),
        decoration: new BoxDecoration(
          color: Colors.yellow,
          borderRadius: new BorderRadius.circular(55.0),
          border: new Border.all(
            width: 5.0,
            color: Colors.red,
          ),
        ),
        child: Center(child: const Text('Hello Flutter', textAlign: TextAlign.center)),

      ),
* */

/*
* TODO Container with Alignment property
*
* Container(
        margin: EdgeInsets.all(20.0),
        width: double.infinity,
        height: 300.0,
        color: Colors.red,
        alignment: Alignment.topRight,
        padding: EdgeInsets.all(20.0),
        child: FlutterLogo(size: 100.0,),
      ),
*
* */

/*
* TODO Container with Box Constraints
*
* Container(
          margin: EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxWidth: 400.0,
            minWidth: 200.0
          ),
          width: 50.0,
          alignment: Alignment.topCenter,
          child: Image.network('https://picsum.photos/500/400'),
        ),
*
* */

/*
* TODO Container with List of BoxShadow
*
* Container(
          height: 100.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
              BoxShadow(color: Colors.red, blurRadius: 12.0 ),
              BoxShadow(color: Colors.green, blurRadius: 40.0)
              ]
          ),
        )
*
*
*
* */

/*
* TODO Container with Image and Rounded Border
*
* Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              image: DecorationImage(fit: BoxFit.cover,
                  image: NetworkImage('https://picsum.photos/200/300'))
          ),
        )
*
*
* */

/*
* TODO Circular Container
*
* Container(
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200.0),
              color: Colors.green,
          ),
          child: Text('Hello'),
        )
*
*
* */

/*
* TODO Container with Horizontal Radius of Left Radius and Right Radius
*
* Container(
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.0),
              right: Radius.circular(80.0)
            ),
              color: Colors.green,
          ),
          child: Text('Hello'),
        )
*
* */

/*
* TODO Container with Vertical Radius of Top Radius and Bottom Radius
*
* Container(
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
              bottom: Radius.circular(80.0)
            ),
              color: Colors.green,
          ),
          child: Text('Hello'),
        )
*
* */
