// ignore_for_file: avoid_print
import 'package:facebookui/data/data.dart';
import 'package:facebookui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/post_models.dart';
import '../widgets/postContainer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:  Scaffold(
        body: responsive(
          mobile: _HomeScreen(scrollController: _trackingScrollController),
          
          desktop: HomeDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key, required this.scrollController}) : super(key: key);
final TrackingScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      // ignore: prefer_const_literals_to_create_immutables
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
              Stories: const [], stoires: [],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            }),
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({Key? key, required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.all(12.0),
            child:MoreOptionsList(currentUser:currentUser),
            
            ),
          ),
        ),
        const Spacer(),
        Container(
            width: 600.0,
            child: CustomScrollView(
              
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(
                      onlineUsers: onlineUsers,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Stories(
                      currentUser: currentUser,
                      stories: stories,
                      stoires: const [], Stories: const [],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    ((context, index) {
                      final Post post = posts[index];
                      return PostContainer(post: post);
                    }),
                    childCount: posts.length,
                  ),
                ),
              ],
            )),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(padding: EdgeInsets.all(12.0),
            child:ContactList(user:onlineUsers),
            
            ),
          ),

        ),
      ],
    );
  }
}
