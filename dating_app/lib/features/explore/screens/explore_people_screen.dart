import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/custom_bottom_navbar.dart';
import 'package:dating_app/features/explore/widgets/swipe_action_buttons.dart';
import 'package:dating_app/features/explore/widgets/swipe_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  final CardSwiperController _cardSwiperController = CardSwiperController();
  String? _iconToShow;

  final List<Map<String, String>> _candidates = const [
    {"image": AppAssets.girl4, "name": "Alice", "profession": "Model"},
    {
      "image": AppAssets.cardSwipe2,
      "name": "Ahmaryar Khan",
      "profession": "MERN Developer"
    },
    {
      "image": AppAssets.cardSwipe3,
      "name": "Ahmaryar Khan",
      "profession": "Flutter Developer"
    },
    {
      "image": AppAssets.girl1,
      "name": "Diana",
      "profession": "Insta Model"
    },
  ];

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  void _showFeedback(String action) {
    setState(() {
      _iconToShow = action;
    });
    Fluttertoast.showToast(
      msg: action == 'like'
          ? "Liked"
          : action == 'dislike'
              ? "Disliked"
              : "Starred",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: Image.asset(AppAssets.btnBack, width: 44, height: 44),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Discover",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              "Pakistan",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Image.asset(AppAssets.btnFilter, width: 44, height: 44),
              onPressed: () {
                Fluttertoast.showToast(msg: "Filter opened");
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  CardSwiper(
                    controller: _cardSwiperController,
                    cardsCount: _candidates.length,
                    cardBuilder: (context, index, percentX, percentY) {
                      final candidate = _candidates[index];
                      return SwipeCardItem(
                        imagePath: candidate["image"]!,
                        name: candidate["name"]!,
                        profession: candidate["profession"]!,
                      );
                    },
                    allowedSwipeDirection: const AllowedSwipeDirection.only(
                      left: true,
                      right: true,
                      up: true,
                    ),
                    numberOfCardsDisplayed: 2,
                    isLoop: true,
                    backCardOffset: const Offset(0, -35),
                    onSwipe: (previousIndex, current, direction) {
                      if (direction == CardSwiperDirection.right) {
                        _showFeedback('like');
                      } else if (direction == CardSwiperDirection.left) {
                        _showFeedback('dislike');
                      } else if (direction == CardSwiperDirection.top) {
                        _showFeedback('star');
                      }
                      return true;
                    },
                  ),
                  if (_iconToShow != null)
                    Positioned(
                      top: _iconToShow == 'dislike' ? 180 : null,
                      right: _iconToShow == 'like' ? 30 : null,
                      left: _iconToShow == 'star' ? 130 : null,
                      bottom: _iconToShow == 'like' ? 140 : null,
                      child: Image.asset(
                        "assets/images/$_iconToShow.png",
                        width: 90,
                        height: 90,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SwipeActionButtons(
            onDislike: () {
              _cardSwiperController.swipe(CardSwiperDirection.left);
            },
            onLike: () {
              _cardSwiperController.swipe(CardSwiperDirection.right);
            },
            onStar: () {
              _cardSwiperController.swipe(CardSwiperDirection.top);
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
