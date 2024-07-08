import 'package:flutter_share/flutter_share.dart';

abstract class ShareService {
  Future<void> share(
    Map<String, dynamic> data,
  );
}

class ShareServiceImpl extends ShareService {
  @override
  Future<void> share(
    Map<String, dynamic> data,
  ) async {
    await FlutterShare.share(
      title: data["title"],
      text: data["text"],
      linkUrl: data['linkUrl'],
      chooserTitle: data['chooserTitle'],
    );
  }
}
