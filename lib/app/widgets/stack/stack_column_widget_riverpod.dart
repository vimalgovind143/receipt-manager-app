/*
 * Copyright (c) 2020 - 2021 : William Todt
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:receipt_manager/app/pages/home/home_notifier.dart';
import 'package:receipt_manager/app/widgets/icon/icon_tile.dart';

class StackColumnWidgetRiverpod extends StatelessWidget {
  final HomeNotifier notifier;

  const StackColumnWidgetRiverpod({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        IconTile(
            width: 60,
            height: 60,
            iconData: Icons.filter,
            fun: () => notifier.galleryPicker(context)),
        const SizedBox(height: 20),
        IconTile(
          width: 60,
          height: 60,
          iconData: Icons.camera_alt,
          fun: () => notifier.cameraPicker(context),
        ),
      ],
    );
  }
}