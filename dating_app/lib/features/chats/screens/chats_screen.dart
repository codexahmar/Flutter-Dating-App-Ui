import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/custom_bottom_navbar.dart';
import 'package:dating_app/features/chats/widgets/activity_story_avatar.dart';
import 'package:dating_app/features/chats/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<Map<String, dynamic>> _statuses = const [
    {'name': 'Alice', 'image': AppAssets.girl1, 'isNew': true},
    {'name': 'Jessica', 'image': AppAssets.girl2, 'isNew': false},
    {'name': 'Charlie', 'image': AppAssets.girl3, 'isNew': true},
    {'name': 'Ariana', 'image': AppAssets.user2, 'isNew': false},
    {'name': 'John', 'image': AppAssets.user3, 'isNew': true},
    {'name': 'Doe', 'image': AppAssets.girl4, 'isNew': false},
  ];

  final List<Map<String, String>> _chats = const [
    {
      'name': 'John',
      'lastMessage': "Hey, what's up?",
      'time': '2m ago',
      'image': AppAssets.user3,
    },
    {
      'name': 'Ariana',
      'lastMessage': 'Are we still on for tonight?',
      'time': '15m ago',
      'image': AppAssets.user2,
    },
    {
      'name': 'Charlie',
      'lastMessage': 'Typing...',
      'time': '30m ago',
      'image': AppAssets.girl3,
    },
    {
      'name': 'Chloe',
      'lastMessage': 'Ok, see you then.',
      'time': '30m ago',
      'image': AppAssets.user5,
    },
    {
      'name': 'Kendrick',
      'lastMessage': 'Can you send me the photos?',
      'time': '30m ago',
      'image': AppAssets.user3,
    },
    {
      'name': 'Grace',
      'lastMessage': 'Hello, how are you doing?',
      'time': '30m ago',
      'image': AppAssets.user6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Filter opened");
                    },
                    icon: Image.asset(AppAssets.btnFilter, width: 44, height: 44),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search chats',
                    hintStyle: TextStyle(color: AppColors.textMuted),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Activities",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 96,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _statuses.length,
                  itemBuilder: (context, index) {
                    final status = _statuses[index];
                    return ActivityStoryAvatar(
                      name: status['name'] as String,
                      imagePath: status['image'] as String,
                      isNew: status['isNew'] as bool,
                      onTap: () {
                        Fluttertoast.showToast(msg: "Viewing ${status['name']}'s story");
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Messages",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: _chats.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.divider,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final chat = _chats[index];
                    return ChatListItem(
                      name: chat['name']!,
                      lastMessage: chat['lastMessage']!,
                      time: chat['time']!,
                      imagePath: chat['image']!,
                      onTap: () {
                        Fluttertoast.showToast(msg: "Opening chat with ${chat['name']}");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
