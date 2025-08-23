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

import 'dart:core';
import 'dart:io';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:receipt_manager/app/pages/upload/upload_controller.dart';
import 'package:receipt_manager/app/widgets/padding/padding_widget.dart';
import 'package:receipt_manager/data/repository/data_receipts_repository.dart';
import 'package:receipt_manager/generated/l10n.dart';

// ignore: must_be_immutable
class ImageUploadPage extends StatefulWidget {
  File image;

  ImageUploadPage(this.image, {Key? key}) : super(key: key);

  @override
  State<ImageUploadPage> createState() => ImageUploadState();
}

class ImageUploadState extends State<ImageUploadPage> {
  late UploadController controller;

  @override
  void initState() {
    super.initState();
    controller = UploadController(DataReceiptRepository());
  }

  Widget submitButton(UploadController controller) => PaddingWidget(
      padding: 32.0,
      widget: Align(
        alignment: Alignment.bottomRight,
        child: NeumorphicButton(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              color: Colors.green,
              boxShape: NeumorphicBoxShape.stadium(),
            ),
            onPressed: () => controller.sendReceipt(widget.image),
            child: Text(S.of(context).upload,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NeumorphicAppBar(title: Text(S.of(context).showImage)),
        body: Container(
            height: double.infinity,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new FileImage(widget.image),
              fit: BoxFit.cover,
            )),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[submitButton(controller)]),
            ])));
  }
}
