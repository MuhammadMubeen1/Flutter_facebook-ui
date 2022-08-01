

import 'package:facebookui/data/data.dart';
import 'package:facebookui/screens/home_screen.dart';
import 'package:facebookui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_tabar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return DefaultTabController(

      length: _icons.length,
      child: Scaffold(
        appBar: responsive.isDesktop(context)? 
        PreferredSize(preferredSize: Size(screenSize.width,100.0),
        child: CustomAppBAr(
          currentUser:currentUser,
          icon: _icons,
          selectedIndex:_selectedIndex,
          onTap:(index)=>setState(()=>_selectedIndex=index),
           ),

        ):null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTaBar(
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() => _selectedIndex = index);
                    }),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
