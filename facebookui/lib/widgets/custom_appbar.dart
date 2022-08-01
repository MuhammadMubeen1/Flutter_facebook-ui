import 'package:facebookui/config/palette.dart';
import 'package:facebookui/models/user_model.dart';
import 'package:facebookui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBAr extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;
  final int selectedIndex;
  final Function(int) onTap;
  CustomAppBAr({
    required this.icon,
    required this.selectedIndex,
    required this.onTap,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4.0,
        ),
      ]),

// ignore: prefer_const_literals_to_create_immutables
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTaBar(
              icons: icon,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator:true
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(width: 12.0,),
              CircleButton(icon:Icons.search,iconSize:
               30.0,onPressed: ()=>print('Search'),),
               CircleButton(icon:MdiIcons.facebookMessenger,iconSize:
               30.0,onPressed: ()=>print('Messanger'),),
               
            ],
          ))
        ],
      ),
    );
  }
}
