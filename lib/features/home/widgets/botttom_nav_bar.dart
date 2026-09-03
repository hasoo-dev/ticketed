import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primary = AppColors.darkBorder;
    const inactive = AppColors.darkTextSecondary;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 82,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .08),
                blurRadius: 15,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: _item(
                  icon: Icons.home_rounded,
                  title: "Home",
                  selected: currentIndex == 0,
                  activeColor: primary,
                  inactiveColor: inactive,
                  onTap: () => onTap(0),
                ),
              ),
              Expanded(
                child: _item(
                  icon: Icons.description_outlined,
                  title: "Quotes",
                  selected: currentIndex == 1,
                  activeColor: primary,
                  inactiveColor: inactive,
                  onTap: () => onTap(1),
                ),
              ),

              const SizedBox(width: 70),

              Expanded(
                child: _item(
                  icon: Icons.article_outlined,
                  title: "Templates",
                  selected: currentIndex == 3,
                  activeColor: primary,
                  inactiveColor: inactive,
                  onTap: () => onTap(3),
                ),
              ),
              Expanded(
                child: _item(
                  icon: Icons.people_outline,
                  title: "Clients",
                  selected: currentIndex == 4,
                  activeColor: primary,
                  inactiveColor: inactive,
                  onTap: () => onTap(4),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: -22,
          child: GestureDetector(
            onTap: () => onTap(2),
            child: Column(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withValues(alpha: .45),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 34),
                ),
                const SizedBox(height: 4),
                const Text(
                  "New Quote",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff8A6B00),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _item({
    required IconData icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: selected ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: selected ? Colors.white : inactiveColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: selected ? const Color(0xff8A6B00) : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
