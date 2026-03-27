import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.10),
        blurRadius: 15,
        offset: const Offset(5, 5),
      ),
    ],
  ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: GoogleFonts.notoSansArabic(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: StyleRepo.black,
            ),
          ),
          const Gap(20),
          Column(
            children: items
                .map(
                  (item) => _CustomCardRow(item: item),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _CustomCardRow extends StatefulWidget {
  final CustomCardItem item;
  const _CustomCardRow({required this.item});

  @override
  State<_CustomCardRow> createState() => _CustomCardRowState();
}

class _CustomCardRowState extends State<_CustomCardRow> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.item.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: StyleRepo.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(12),
            border: _isPressed
                ? Border.all(color: StyleRepo.glowGreen, width: 2)
                : null,
          ),
          child: Row(
            children: [
              Text(
                widget.item.leading,
                style: GoogleFonts.notoSansArabic(
                  color: widget.item.leadingColor ?? StyleRepo.glowGreen,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.item.title,
                    style: GoogleFonts.notoSansArabic(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: StyleRepo.black,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    widget.item.subtitle,
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}