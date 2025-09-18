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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/app/pages/settings/settings_notifier.dart';
import 'package:receipt_manager/app/widgets/padding/padding_widget.dart';
import 'package:receipt_manager/generated/l10n.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPageRiverpod extends ConsumerWidget {
  const SettingsPageRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsNotifierProvider);
    final settingsNotifier = ref.read(settingsNotifierProvider.notifier);

    return Material(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NeumorphicAppBar(title: Text(S.of(context).settings)),
        body: PaddingWidget(
          widget: SettingsList(
            shrinkWrap: true,
            sections: [
              SettingsSection(
                title: Text(S.of(context).networkSettings),
                tiles: [
                  SettingsTile(
                    title: Text(S.of(context).serverSettings),
                    leading: const Icon(Icons.wifi),
                    onPressed: (context) => settingsNotifier.serverButtonPress(context),
                  ),
                  SettingsTile(
                    title: Text(S.of(context).apiToken),
                    leading: const Icon(Icons.vpn_key),
                    onPressed: (context) => settingsNotifier.apiTokenButtonPress(context),
                  ),
                  SettingsTile.switchTile(
                    initialValue: settingsState.https,
                    title: const Text("HTTPS"),
                    leading: const Icon(Icons.lock),
                    onToggle: (bool value) => settingsNotifier.toggleHttps(value),
                  ),
                ],
              ),
              SettingsSection(
                title: Text(S.of(context).cameraSettings),
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: settingsState.rotateImage,
                    title: Text(S.of(context).rotateImage),
                    leading: const Icon(Icons.rotate_right_sharp),
                    onToggle: (bool value) => settingsNotifier.toggleRotateImage(value),
                  ),
                  SettingsTile.switchTile(
                    initialValue: settingsState.grayscaleImage,
                    title: Text(S.of(context).grayscaleImage),
                    leading: const Icon(Icons.wb_incandescent_outlined),
                    onToggle: (bool value) => settingsNotifier.toggleGrayscaleImage(value),
                  ),
                  SettingsTile.switchTile(
                    initialValue: settingsState.gaussianBlur,
                    title: Text(S.of(context).gaussianBlur),
                    leading: const Icon(Icons.blur_on_outlined),
                    onToggle: (bool value) => settingsNotifier.toggleGaussianBlur(value),
                  ),
                ],
              ),
              SettingsSection(
                title: Text(S.of(context).developerSettings),
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: settingsState.debugOutput,
                    title: Text(S.of(context).enableDebugOutput),
                    leading: const Icon(Icons.bug_report),
                    onToggle: (bool value) => settingsNotifier.toggleDebugOutput(value),
                  ),
                  SettingsTile.switchTile(
                    initialValue: settingsState.showArticles,
                    title: Text(S.of(context).showArticles),
                    leading: const Icon(Icons.category),
                    onToggle: (bool value) => settingsNotifier.toggleShowArticles(value),
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