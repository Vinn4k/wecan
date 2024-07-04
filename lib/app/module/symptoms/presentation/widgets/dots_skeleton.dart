import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';
import '../../data/models/symptoms_response_model.dart';
import 'dots_item.dart';

class DotsSkeleton extends StatelessWidget {
  const DotsSkeleton({super.key, required this.symptoms, required this.title});
  final List<SymptomsResponseModel> symptoms;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.black, width: 2),
      ),
      padding: const EdgeInsets.all(19.0),
      height: 250,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(title, style: AppTypography.title.copyWith(fontSize: 24)),
          ),
          const SizedBox(height: 22),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 160,
                  childAspectRatio: 3 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: symptoms.length,
                itemBuilder: (context, index) => DotsItem(
                      onTap: () {},
                      title: symptoms[index].name,
                    )),
          ),
        ],
      ),
    );
  }
}
