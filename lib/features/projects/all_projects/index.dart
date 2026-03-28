import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/services/pagination/options/list_view.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_header.dart';
import 'controller/controller.dart';
import 'model/project_model.dart';
import 'widgets/program_card.dart';

class AllProjectsPage extends StatelessWidget {
  AllProjectsPage({super.key});

  final controller = Get.find<AllProjectsController>(
    tag: AllProjectsController.tag,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
            child: const CustomHeader(title: "جميع البرامج"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListViewPagination<ProjectModel>.builder(
                tag: AllProjectsController.tag,
                fetchApi: controller.getProjects,
                fromJson: controller.fromJson,
                itemBuilder: (_, index, b) {
                  return ProjectCard(
                    onTap: () {
                      if (b.id != null) {
                        Get.toNamed(
                          Pages.monitoringProject.route,
                          arguments: b.id,
                        );
                      } else {
                        Get.snackbar(
                          "خطأ",
                          "لا يمكن فتح البرنامج (ID غير موجود)",
                        );
                      }
                    },
                    name: b.name ?? "",
                    totalBudgetUsd: b.totalBudgetUsd ?? 0,
                    status: b.status ?? "",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
