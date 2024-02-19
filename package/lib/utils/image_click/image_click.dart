import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package/package.dart';

ImagePicker picker = ImagePicker();

class ImageClick {
  static Future<Either<ImageClickFailure, List<XFile?>>> showImagePickingAlert(
      BuildContext context,
      {required String title,
      bool? multi = false}) async {
    List<XFile?> images = [];
    final imageSource = await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: StyleX.gideonRoman(ctx),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                'Take a picture',
                style: StyleX.gideonRoman(ctx),
              ),
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            CupertinoDialogAction(
              child: Text(
                'Choose from gallery',
                style: StyleX.gideonRoman(ctx),
              ),
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        );
      },
    );
    if (imageSource == null) {
      return left(ImageClickFailure('No source available'));
    } else if (imageSource == ImageSource.camera) {
      await openCamera().then((value) => value.fold(
            (l) => left(ImageClickFailure(l.toString())),
            (r) => images = r,
          ));
    } else if (imageSource == ImageSource.gallery && multi!) {
      await openGalleryMulti().then((value) => value.fold(
            (l) => left(ImageClickFailure(l.toString())),
            (r) => images = r,
          ));
    } else {
      await openGallery().then((value) => value.fold(
            (l) => left(ImageClickFailure(l.toString())),
            (r) => images = r,
          ));
    }
    return right(images);
  }

  static Future<Either<ImageClickFailure, List<XFile?>>> openCamera() async {
    try {
      var data = await picker.pickImage(source: ImageSource.camera);
      if (data == null) return right([]);
      return right([data]);
    } catch (e) {
      return left(ImageClickFailure(e.toString()));
    }
  }

  static Future<Either<ImageClickFailure, List<XFile?>>>
      openGalleryMulti() async {
    try {
      var data = await picker.pickMultiImage();
      return right(data);
    } catch (e) {
      return left(ImageClickFailure(e.toString()));
    }
  }

  static Future<Either<ImageClickFailure, List<XFile?>>> openGallery() async {
    try {
      var data = await picker.pickImage(source: ImageSource.gallery);
      if (data == null) return left(ImageClickFailure('user cancel'));
      data.path.log;
      return right([data]);
    } catch (e) {
      e.log;
      return left(ImageClickFailure(e.toString()));
    }
  }

  static Future<Either<ImageClickFailure, List<XFile?>>> openMedia() async {
    try {
      var data = await picker.pickMedia();
      if (data == null) return right([]);
      return right([data]);
    } catch (e) {
      return left(ImageClickFailure(e.toString()));
    }
  }

  static Future<Either<ImageClickFailure, List<XFile?>>>
      openMultiMedia() async {
    try {
      var data = await picker.pickMultipleMedia();
      return right(data);
    } catch (e) {
      return left(ImageClickFailure(e.toString()));
    }
  }
}

class ImageClickFailure implements Exception {
  final String err;
  ImageClickFailure(String? error) : err = "ImageClickError => $error";

  @override
  String toString() => 'ImageClickFailure{err: $err}';
}
