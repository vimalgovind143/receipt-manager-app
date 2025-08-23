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
import 'package:receipt_manager/app/pages/settings/settings_controller.dart';
import 'package:receipt_manager/app/widgets/padding/padding_widget.dart';
import 'package:receipt_manager/generated/l10n.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  late SettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = SettingsController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: NeumorphicAppBar(title: Text(S.of(context).settings)),
            body: PaddingWidget(
                widget: SettingsList(
              shrinkWrap: true,
                sections: [
                  SettingsSection(title: Text(S.of(context).networkSettings), tiles: [
                    SettingsTile(
                        title: Text(S.of(context).serverSettings),
                        leading: const Icon(Icons.wifi),
                        onPressed: (context) =>
                            controller.serverButtonPress(context)),
                    SettingsTile(
                        title: Text(S.of(context).apiToken),
                        leading: const Icon(Icons.vpn_key),
                        onPressed: controller.apiTokenButtonPress),
                    SettingsTile.switchTile(
                        initialValue: controller.https,
                        title: Text("HTTPS"),
                        leading: const Icon(Icons.lock),
                        onToggle: (bool value) => controller.toggleHttps(value))
                  ]),
                  SettingsSection(
                    title: Text(S.of(context).cameraSettings),
                    tiles: [
                      SettingsTile.switchTile(
                          initialValue: controller.rotateImage,
                          title: Text(S.of(context).rotateImage),
                          leading: const Icon(Icons.rotate_right_sharp),
                          onToggle: (bool value) =>
                              controller.toggleRotateImage(value)),
                      SettingsTile.switchTile(
                          initialValue: controller.grayscaleImage,
                          title: Text(S.of(context).grayscaleImage),
                          leading: const Icon(Icons.wb_incandescent_outlined),
                          onToggle: (bool value) =>
                              controller.toggleGrayscaleImage(value)),
                      SettingsTile.switchTile(
                          initialValue: controller.gaussianBlur,
                          title: Text(S.of(context).gaussianBlur),
                          leading: const Icon(Icons.blur_on_outlined),
                          onToggle: (bool value) =>
                              controller.toggleGaussianBlur(value))
                    ],
                  ),
                  SettingsSection(
                    title: Text(S.of(context).developerSettings),
                    tiles: [
                      SettingsTile.switchTile(
                          initialValue: controller.debugOutput,
                          title: Text(S.of(context).enableDebugOutput),
                          leading: const Icon(Icons.bug_report),
                          onToggle: (bool value) =>
                              controller.toggleDebugOutput(value)),
                      SettingsTile.switchTile(
                          initialValue: controller.showArticles,
                          title: Text(S.of(context).showArticles),
                          leading: const Icon(Icons.category),
                          onToggle: (bool value) =>
                              controller.toggleShowArticles(value)),
                    ],
                  ),
                ],
              ))));
  }
}
