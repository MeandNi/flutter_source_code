import 'package:flutter/material.dart';

// 数据类
class Item {
  const Item({this.title, this.icon});

  final String title;
  final IconData icon;
}



class AppBarSample extends StatefulWidget {
  @override
  _AppBarSampleState createState() => _AppBarSampleState();
}

class _AppBarSampleState extends State<AppBarSample>
    with SingleTickerProviderStateMixin {

  // 存放各个可选项的数组
  List<Item> items = const <Item>[
    const Item(title: 'Item1', icon: Icons.directions_car),
    const Item(title: 'Item2', icon: Icons.directions_bike),
    const Item(title: 'Item3', icon: Icons.directions_boat),
    const Item(title: 'Item4', icon: Icons.directions_walk),
  ];

  // 创建切换导航控制器
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化控制器
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 顶部菜单栏
      appBar: AppBar(
          leading: Icon(Icons.home),   // 导航图标
          title: Text('AppBar Title'), // 页面标题
          actions: <Widget>[
            // 顶部菜单
            IconButton(
              onPressed: () {
                print('点击菜单栏');
              },
              icon: Icon(Icons.build),
            ),
            IconButton(
              onPressed: () {
                print('点击菜单栏');
              },
              icon: Icon(Icons.add),
            )
          ],
          bottom: TabBar(
            // 选项可滚动
//            isScrollable: true,
            // 为 TabBar 配置控制器
            controller: _tabController,
            tabs: items.map((Item item) {
              // 根据数据返回 Tab 组件
              return Tab(
                text: item.title,
                icon: Icon(item.icon),
              );
            }).toList(),
          )),
          // Scaffold 中的主体布局
          body: TabBarView(
            // 为 TabBarView 配置与 TabBar 相同的控制器
            controller: _tabController,
            children: items.map((Item item) {
              // 返回相应选项中主体显示的组件
              return Center(
                child: Text(item.title, style: TextStyle(fontSize: 20.0),),
              );
            }).toList(),
          ),

//      body: Center(
//        child: Text('body'),
//      ),
      // FloatingActionButton 悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
