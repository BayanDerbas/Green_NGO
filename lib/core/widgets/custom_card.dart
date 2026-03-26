import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../style/repo.dart';

class CustomCardItem {
  final String leading;
  final String title;
  final String subtitle;
  final Color? leadingColor;
  final VoidCallback? onTap;

  CustomCardItem({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.leadingColor,
    this.onTap,
  });
}

class CustomCard extends StatelessWidget {
  final String title;
  final List<CustomCardItem> items;

  const CustomCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: StyleRepo.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: StyleRepo.grey.withOpacity(.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const Gap(20),

          Column(
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: item.onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: StyleRepo.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text(
                              item.leading,
                              style: TextStyle(
                                color: item.leadingColor ?? StyleRepo.deepGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  item.subtitle,
                                  style: TextStyle(
                                    color: StyleRepo.deepGrey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
