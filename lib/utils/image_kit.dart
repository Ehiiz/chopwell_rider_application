import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> imageUpload(File file) async {
  try {
    if (Platform.isIOS) {
      PermissionStatus requestGranted = await Permission.photos.request();
      if (requestGranted.isPermanentlyDenied) {
        print("I entered Cloudinary at all");

        final url = await ImageKit.io(
          file,
          //  folder: "chopwell/restaurant",
          privateKey:
              "private_2yODU0rJpOUOOrp6SOhrd6lPyCc=", // (Keep Confidential)
          onUploadProgress: (progressValue) {
            print(progressValue);

            // if (kDebugMode) {
            //   print(progressValue);
            // }
          },
        );
        if (kDebugMode) {
          print(url);
        }
        print(url);
        return url;
      }
    } else {
      final url = await ImageKit.io(
        file,
        //  folder: "chopwell/restaurant",
        privateKey:
            "private_2yODU0rJpOUOOrp6SOhrd6lPyCc=", // (Keep Confidential)
        onUploadProgress: (progressValue) {
          print(progressValue);

          if (kDebugMode) {
            print(progressValue);
          }
        },
      );
      if (kDebugMode) {
        print(url);
      }
      return url;
    }
  } catch (e) {
    print(e.toString());
    return e as String;
  }
}
