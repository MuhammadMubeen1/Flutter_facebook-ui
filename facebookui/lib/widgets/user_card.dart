import 'package:facebookui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        ProfieAvatar(imageUrl: user.imageUrl),
        const SizedBox(
          width: 6.0,
        ),
        Flexible(
          child: Text(
            user.name,
            style: const TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]),
    );
  }
}
