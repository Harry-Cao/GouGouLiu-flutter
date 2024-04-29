import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/modules/message/message.dart';
import 'package:gougouliu_flutter/modules/order/order.dart';
import 'package:gougouliu_flutter/modules/personal/personal.dart';
import 'package:gougouliu_flutter/modules/publish/publish.dart';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/modules/home/home.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<StatefulWidget> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.add_comment),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: "Order",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera_enhance),
        label: "Publish",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.alarm_on),
        label: "Message",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: "Personal",
      ),
    ];

    const pages = <Widget>[
      HomePage(),
      OrderPage(),
      PublishPage(),
      MessagePage(),
      PersonalPage()
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("GouGouLiu"),
      ),
      body: Center(
        child: IndexedStack(index: _currentIndex, children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.bodySmall!.fontSize!,
        unselectedFontSize: textTheme.bodySmall!.fontSize!,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.3),
        backgroundColor: colorScheme.primary,
      ).theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
      ),
    );
  }
}
