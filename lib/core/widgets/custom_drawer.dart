import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_org/core/routes/routes.dart';
import 'package:green_org/core/style/repo.dart';
import '../config/app_builder.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    final app = Get.find<AppBuilder>();

    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        color: StyleRepo.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "منظمة أخضر",
                style: GoogleFonts.notoSansArabic(
                  color: StyleRepo.glowGreen,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(12),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: StyleRepo.glowGreen,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: StyleRepo.glowGreen.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "أ",
                  style: GoogleFonts.notoSansArabic(
                    color: StyleRepo.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          // القائمة
          MenuRow(
            title: "لوحة التحكم",
            icon: Icons.dashboard_outlined,
            isActive: currentRoute == Pages.dashboard.route,
            route: Pages.dashboard.route,
          ),
          // const Gap(10),
          // MenuRow(
          //   title: "المستخدمون",
          //   icon: Icons.people,
          //   isActive: currentRoute == Pages.allUsers.route,
          //   route: Pages.allUsers.route,
          // ),
          const Gap(10),
          MenuRow(
            title: "متابعة المستفيدين",
            icon: Icons.monitor_heart_outlined,
            isActive: currentRoute == Pages.allBeneficiaries.route,
            route: Pages.allBeneficiaries.route,
          ),
          const Gap(10),
          MenuRow(
            title: "إضافة مستفيد",
            icon: Icons.person_add_alt_1,
            isActive: currentRoute == Pages.allUsers.route,
            route: Pages.addBeneficiaries.route,
          ),
          const Gap(10),
          MenuRow(
            title: "المشاريع",
            icon: Icons.track_changes_outlined,
            isActive: false,
            route: Pages.allProjects.route,
          ),
          const Gap(10),
          MenuRow(
            title: "البرامج",
            icon: Icons.menu_book_outlined,
            isActive: currentRoute == Pages.allPrograms.route,
            route: Pages.allPrograms.route,
          ),
          // const Gap(10),
          // MenuRow(
          //   title: "إضافة برنامج",
          //   icon: Icons.library_books_sharp,
          //   isActive: currentRoute == Pages.addProgram.route,
          //   route: Pages.addProgram.route,
          // ),

          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () async {
              await app.logout();
              Get.offAllNamed(Pages.login.route);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: StyleRepo.glownAmber,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: StyleRepo.glownAmber.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.logout_sharp,
                    color: StyleRepo.black,
                    size: 24,
                  ),
                  const Gap(12),
                  Text(
                    "تسجيل الخروج",
                    style: GoogleFonts.notoSansArabic(
                      color: StyleRepo.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (Get.currentRoute != route) {
          Get.toNamed(route);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? StyleRepo.lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: StyleRepo.glowGreen.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: isActive ? StyleRepo.glowGreen : StyleRepo.deepGrey,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.notoSansArabic(
                  color: StyleRepo.black,
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isActive)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: StyleRepo.glowGreen,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
