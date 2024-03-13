import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(children: [StoryArea(), FeedList()]));
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              25,
              (index) => UserStory(
                    name: 'User $index',
                  ))),
    );
  }
}

class UserStory extends StatelessWidget {
  final String name;
  const UserStory({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(36)),
          ),
          Text(name)
        ],
      ),
    );
  }
}

class FeedData {
  final String UserName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.UserName, required this.content, required this.likeCount});
}

final feedDataList = [
  FeedData(UserName: 'User1', content: 'Hello', likeCount: 30),
  FeedData(UserName: 'User2', content: 'Hello', likeCount: 40),
  FeedData(UserName: 'User3', content: 'Hello', likeCount: 19810),
  FeedData(UserName: 'User4', content: 'Hello', likeCount: 502595),
  FeedData(UserName: 'User5', content: 'Hello', likeCount: 8454489465),
  FeedData(UserName: 'User6', content: 'Hello', likeCount: 1),
  FeedData(UserName: 'User7', content: 'Hello', likeCount: 0),
  FeedData(UserName: 'User8', content: 'Hello', likeCount: 5),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(
        feedData: feedDataList[index],
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.UserName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 350,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('좋아요 ${feedData.likeCount}개',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: feedData.UserName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' '),
              TextSpan(
                text: feedData.content,
              )
            ], style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
