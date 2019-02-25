import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabsWidget extends StatefulWidget {
  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color indicatorColor;
  final Widget drawer;
  final Widget floatingActionButton;
  final TarWidgetControl tarWidgetControl;
  final PageController topPageControl;

  BottomTabsWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.topPageControl,
  }) : super(key: key);

  @override
  BottomTabsWidgetState createState() => new BottomTabsWidgetState(
      type,
      tabItems,
      tabViews,
      backgroundColor,
      indicatorColor,
      drawer,
      floatingActionButton,
      topPageControl);
}

class BottomTabsWidgetState extends State<BottomTabsWidget>
    with SingleTickerProviderStateMixin {
  final int _type;
  final List<Widget> _tabItems;
  final List<Widget> _tabViews;
  final Color _backgroundColor;
  final Color _indicatorColor;
  final Widget _drawer;
  final Widget _floatingActionButton;
  final PageController _pageController;

  BottomTabsWidgetState(
      this._type,
      this._tabItems,
      this._tabViews,
      this._backgroundColor,
      this._indicatorColor,
      this._drawer,
      this._floatingActionButton,
      this._pageController)
      : super();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        ///设置侧边滑出 drawer，不需要可以不设置
        drawer: _drawer,

        ///设置悬浮按键，不需要可以不设置
        floatingActionButton: _floatingActionButton,

        ///页面主体，PageView，用于承载Tab对应的页面
        body: new PageView(
          ///必须有的控制器，与tabBar的控制器同步
          controller: _pageController,

          ///每一个 tab 对应的页面主体，是一个List<Widget>
          children: _tabViews,
          onPageChanged: (index) {
            ///页面触摸作用滑动回调，用于同步tab选中状态
            _tabController.animateTo(index);
          },
        ),

        ///底部导航栏，也就是tab栏
        bottomNavigationBar: new Material(
          color: _backgroundColor,

          ///tabBar控件
          child: new TabBar(
            ///必须有的控制器，与pageView的控制器同步
            controller: _tabController,

            ///每一个tab item，是一个List<Widget>
            tabs: _tabItems,

            ///tab底部选中条颜色
            indicatorColor: _indicatorColor,
          ),
        ));
  }

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabItems.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BottomTabsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
