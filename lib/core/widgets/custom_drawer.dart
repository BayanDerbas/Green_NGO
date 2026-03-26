import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/style/repo.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;

    return Container(
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: const BoxDecoration(
        color: StyleRepo.white,
        border: Border(right: BorderSide(color: StyleRepo.grey, width: 0.3)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "منصة أخضر",
                style: TextStyle(
                  color: StyleRepo.glowGreen,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: StyleRepo.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.nature, color: StyleRepo.glowGreen),
              ),
            ],
          ),
          const Gap(16),

          const Divider(),

          const Gap(10),
          MenuRow(
            title: "لوحة التحكم",
            icon: Icons.dashboard_outlined,
            isActive: currentRoute == Pages.dashboard.route,
            route: Pages.dashboard.route,
          ),

          const Gap(6),

          MenuRow(
            title: "متابعة المستفيدين",
            icon: Icons.people_outline,
            isActive: currentRoute == Pages.allBeneficiaries.route,
            route: Pages.allBeneficiaries.route,
          ),

          const Gap(6),

          MenuRow(
            title: "إضافة مستفيد",
            icon: Icons.person_add_alt_1,
            isActive: currentRoute == Pages.addBeneficiaries.route,
            route: Pages.addBeneficiaries.route,
          ),
        ],
      ),
    );
  }
}

class MenuRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final String route;

  const MenuRow({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        if (Get.currentRoute != route) {
          Get.toNamed(route);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? StyleRepo.lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? StyleRepo.glowGreen : StyleRepo.deepGrey,
            ),

            const Gap(10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: StyleRepo.deepGrey, fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
