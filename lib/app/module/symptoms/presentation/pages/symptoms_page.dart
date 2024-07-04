import 'package:flutter/material.dart';
import 'package:wecan/app/core/theme/app_colors.dart';
import 'package:wecan/app/core/theme/app_typography.dart';

import '../controller/symptoms_controller.dart';
import '../widgets/dots_item.dart';
import '../widgets/dots_skeleton.dart';

class SymptomsPage extends StatelessWidget {
  const SymptomsPage({
    super.key,
    required this.controller,
  });

  final SymptomsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Symptoms',
          style: AppTypography.title,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: controller.loading,
        builder: (context, value, child) {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'O que você \n está sentindo?',
                      style: AppTypography.title,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DotsSkeleton(
                    symptoms: controller.symptoms,
                    title: 'Cabeça',
                  ),
                  const SizedBox(height: 30),
                  DotsSkeleton(
                    symptoms: controller.symptoms,
                    title: 'Braços',
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
