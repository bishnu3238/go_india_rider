import 'package:flutter/material.dart';

import '../../package.dart';

Future<Either<ImageClickFailure, List<XFile?>>> showImagePickingOptions(
  BuildContext context,
) async {
  return await showSheet<Either<ImageClickFailure, List<XFile?>>>(
    onClosing: () => left(ImageClickFailure('user not open the gallery')),
    context: context,
    widget: (BuildContext context) => Padding(
      padding: edgeInsets0520,
      child: Wrap(
        children: [
          Padding(
            padding: edgeInsets2025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageTextColumn(
                  icon: Icons.folder,
                  label: "GALLERY",
                  onTap: () async => await ImageClick.openGallery().then(
                    (value) => Navigator.of(context).pop(value),
                  ),
                ),
                const SizedBox(width: 50),
                ImageTextColumn(
                  icon: Icons.photo_camera,
                  label: "CAMERA",
                  onTap: () async => await ImageClick.openCamera().then(
                    (value) => Navigator.of(context).pop(value),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ).then((value) {
    if (value == null) return left(ImageClickFailure('user close picker'));
    return value;
  });
}
