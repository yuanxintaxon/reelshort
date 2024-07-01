
import 'package:get/get.dart';

class DioDownloadController extends GetxController {
  final isDownloadingVoice = false.obs;


  /*
  void cacheVoiceMessagesInBulk(List<Message> messages) async {
    isDownloadingVoice.value = false;
    for (Message message in messages) {
      await cacheVoiceMessage(message);
    }
    isDownloadingVoice.value = true;
  }

  void cacheSingleVoiceMessage(Message message) async {
    isDownloadingVoice.value = false;
    await cacheVoiceMessage(message);
    isDownloadingVoice.value = true;
  }

  Future<void> cacheVoiceMessage(Message message) async {
    if (message.contentType == MessageType.voice) {
      Logger.print("creturn is planning to cached voice ");
      final url = message.soundElem?.sourceUrl;
      if (url?.isNotEmpty == true) {
        Logger.print("creturn is checking to cache voice");
        String fileName = IMUtils.getFileNameFromUrl(url!);
        String? soundPath = message.soundElem?.soundPath;
        String? sourceCachePath =
            await IMUtils.getCacheFile(dir: 'voice', name: fileName);
        bool existFile = false;

        if (soundPath != null && soundPath.trim().isNotEmpty) {
          existFile = await File(soundPath).exists();
        }
        if (sourceCachePath != null && sourceCachePath.trim().isNotEmpty) {
          existFile = await File(sourceCachePath).exists();
        }

        if (existFile == false) {
          final targetCachePath =
              await IMUtils.createTempFile(dir: 'voice', name: fileName);
          Logger.print("creturn is started downloading");
          await HttpUtil.saveUrlVoice(url, targetCachePath);
          Logger.print("creturn is cached voice completed ${targetCachePath}");
        } else {
          Logger.print("creturn is already cached voice ");
        }
      }
    }
  }
  */
}
