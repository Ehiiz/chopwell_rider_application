import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';

Future<String> imageUpload(File file) async {
  try {
    final url = await ImageKit.io(
      file,
      // folder: "folder_name/nested_folder", (Optional)
      privateKey: "private_2yODU0rJpOUOOrp6SOhrd6lPyCc=", // (Keep Confidential)
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
  } catch (e) {
    print(e.toString());
    return e as String;
  }
}
