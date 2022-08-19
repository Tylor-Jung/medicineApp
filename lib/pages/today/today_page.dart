import 'dart:io';

import 'package:app_project/components/app_constants.dart';
import 'package:app_project/main.dart';
import 'package:app_project/models/medicine_alarm.dart';
import 'package:app_project/pages/today/today_empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/medicine.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        '오늘 복용할 약은?',
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(height: regularSpace),
      Expanded(
        child: ValueListenableBuilder(
          valueListenable: medicineRepository.medicineBox.listenable(),
          builder: _builderMedicineListView,
        ),
      ),
    ]);
  }

  Widget _builderMedicineListView(context, Box<Medicine> box, _) {
    final medicines = box.values.toList();
    final medicineAlarms = <MedicineAlarm>[];

    if (medicines.isEmpty) {
      return const TodayEmpty();
    }

    for (var medicine in medicines) {
      for (var alarm in medicine.alarms) {
        medicineAlarms.add(MedicineAlarm(
          medicine.id,
          medicine.name,
          medicine.imagePath,
          alarm,
          medicine.key,
        ));
      }
    }

    return Column(
      children: [
        const Divider(height: 1, thickness: 1.0),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: smallSpace),
            itemCount: medicineAlarms.length,
            itemBuilder: (context, index) {
              return MedicinListTile(
                medicineAlarm: medicineAlarms[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: regularSpace,
              );
            },
          ),
        ),
        const Divider(height: 1, thickness: 1.0),
      ],
    );
  }
}

class MedicinListTile extends StatelessWidget {
  const MedicinListTile({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Container(
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: CircleAvatar(
              radius: 40,
              foregroundImage: medicineAlarm.imagePath == null
                  ? null
                  : FileImage(
                      File(medicineAlarm.imagePath!),
                    ),
            ),
          ),
          const SizedBox(width: smallSpace),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🕑${medicineAlarm.alarmTime}', style: textStyle),
                const SizedBox(height: 6),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('${medicineAlarm.name},', style: textStyle),
                    TileActionButton(onTap: () {}, title: '지금'),
                    Text('|', style: textStyle),
                    TileActionButton(onTap: () {}, title: '아까'),
                    Text('먹었어요!', style: textStyle),
                  ],
                )
              ],
            ),
          ),
          CupertinoButton(
              onPressed: () {
                medicineRepository.deleteMedicine(medicineAlarm.key);
              },
              child: const Icon(CupertinoIcons.ellipsis_vertical)),
        ],
      ),
    );
  }
}

class TileActionButton extends StatelessWidget {
  const TileActionButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w500);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
