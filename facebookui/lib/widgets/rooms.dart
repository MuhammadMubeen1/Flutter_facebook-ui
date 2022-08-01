import 'package:facebookui/widgets/profile_avator.dart';
import 'package:facebookui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/user_model.dart';


class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    
    required this.onlineUsers,
  }) ;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfieAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),

      // ignore: avoid_print

      style: OutlinedButton.styleFrom(        
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side:  const BorderSide(
            width: 3.0,
            color:Palette.facebookBlue,
          )
        ),
      ),

      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ShaderMask(shaderCallback:
          //  (rect)=>Palette.createRoomGradient.createShader(rect)),
          //  const Icon(
          //   Icons.video_call,
          //   size: 35,          ),
          const Icon(
            Icons.video_call,
            color: Colors.purple,
            size: 35,          ),
      const SizedBox(width: 4.0,),
      const  Text('Create\n Room'),
        ],
      ),
    );
  }
}

