import 'package:get/get.dart';
import 'package:reelshort/routes/app_navigator.dart';
import 'package:reelshort/routes/app_pages.dart';
import 'package:resource_common/resource_common.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:short_video_scroller/short_video_scroller.dart';

class VideosLogic extends GetxController {
  final data = <Map<String, dynamic>>[].obs;
  List<String> videoWatched = [];

  final autoPlay = false.obs;
  int? initialVideoId;

  final showShareModal = false.obs;
  final Rx<VideoModel?> videoToShare = Rx<VideoModel?>(null);

  @override
  void onInit() {
    final arguments = Get.rootDelegate.arguments();
    final parameters = Get.rootDelegate.parameters;
    autoPlay.value = arguments != null ? arguments['autoPlay'] : false;
    initialVideoId =
        parameters['id'] != null ? int.parse(parameters['id']!) : null;
    super.onInit();
  }

  @override
  void onReady() {
    _initData();
    super.onReady();
  }

  void _initData() async {
    await LoadingView.singleton.wrap(
      asyncFunction: () => _initAll(),
    );
  }

  Future<void> _initAll() async {
    // Start the two asynchronous operations concurrently
    // Use await with Future.wait to wait for both operations to complete
    await Future.wait([
      _loadUserFullInfo(),
    ]);
  }

  Future<void> _loadUserFullInfo() async {
    // final result = await Apis.getUserFullInfo(
    //     userIDList: [(await DataSp.getLoginCertificate())!.userID]);
    // userInfo = result?.first;
    final dummyData = <Map<String, dynamic>>[
      // {
      //   'id': 1,
      //   'url':
      //       'https://chat-dev.ai1268.com/api/object/518789/c45c181a-9ec6-4a1c-8709-5513d342f96b.MOV',
      //   'thumbnail':
      //       'https://chat-dev.ai1268.com/api/object/518789/c5f0fd0c-d3e1-4ffb-a723-9196b1c8a8dc.png?type=image',
      //   'video_title': 'Cat Following',
      //   'description': 'description',
      //   'likes': 5,
      //   'liked': true,
      //   'product_name': 'productName',
      //   'product_permalink': 'productPermalink',
      //   'stock_status': 'stockStatus',
      //   'currentEp': 1,
      //   'totalEp': 83,
      // },
      // {
      //   'id': 2,
      //   'url':
      //       'https://chat-dev.ai1268.com/api/object/518789/cebc5109-c3f5-4b5e-84d8-21d39097b694.MOV',
      //   'thumbnail':
      //       'https://chat-dev.ai1268.com/api/object/518789/804c323e-276c-46f7-a62b-2c4d856fbe60.png?type=image',
      //   'video_title': 'Cat Resting',
      //   'description': 'description',
      //   'likes': 5,
      //   'liked': true,
      //   'product_name': 'productName',
      //   'product_permalink': 'productPermalink',
      //   'stock_status': 'stockStatus',
      //   'currentEp': 1,
      //   'totalEp': 44,
      // },
      {
        'id': 3,
        'url':
            'https://chat-dev.ai1268.com/api/object/518789/a0449e1b-87e2-4f3b-a0c3-67a80c3adaa1.MP4',
        'thumbnail':
            'https://chat-dev.ai1268.com/api/object/518789/4b070588-e93c-4d6b-b683-7bd36f9e717a.png?type=image',
        'video_title': 'Receiving Quotation',
        'description':
            'Join us as we explore the intricate process of receiving quotations at sea. From negotiating prices to assessing quality, discover the challenges and rewards of maritime business dealings firsthand. Whether you\'re a seasoned professional or an aspiring entrepreneur, this video offers valuable insights into the world of international trade on the open waters.',
        'likes': 5,
        'liked': true,
        'product_name': 'productName',
        'product_permalink': 'productPermalink',
        'stock_status': 'stockStatus',
        'currentEp': 1,
        'totalEp': 23,
      },
      {
        'id': 4,
        'url':
            'https://chat-dev.ai1268.com/api/object/518789/b3605055-070f-4b7f-b903-a4b7d2855871.MP4',
        'thumbnail':
            'https://chat-dev.ai1268.com/api/object/518789/12fb3972-9004-4722-8855-1babb63d834a.png?type=image',
        'video_title': 'Restaurant Queue',
        'description':
            'Ever wondered what it\'s like to wait in an endless restaurant queue? In this video, we dive into the bustling world of popular eateries where hungry patrons endure long lines for a taste of culinary delight. From tips to pass the time to behind-the-scenes stories from restaurant staff, join us as we uncover the highs and lows of dining out in a city known for its gastronomic adventures.',
        'likes': 5,
        'liked': true,
        'product_name': 'productName',
        'product_permalink': 'productPermalink',
        'stock_status': 'stockStatus',
        'currentEp': 1,
        'totalEp': 45,
      },
      {
        'id': 5,
        'url':
            'https://chat-dev.ai1268.com/api/object/518789/11cc4e24-423a-4394-a1c4-0eb1498de164.MP4',
        'thumbnail':
            'https://chat-dev.ai1268.com/api/object/518789/b6116fbc-3fa4-4feb-9787-aa31563f63bd.png?type=image',
        'video_title': 'Shopping Mall',
        'description':
            'Step into the grand opening of our city\'s newest shopping destination! Explore state-of-the-art facilities, trendy boutiques, and exciting entertainment options all under one roof. From exclusive previews of flagship stores to interviews with designers and shoppers alike, this video captures the buzz and excitement surrounding the launch of a modern retail paradise. Don\'t miss out on the next big thing in shopping experiences!',
        'likes': 5,
        'liked': true,
        'product_name': 'productName',
        'product_permalink': 'productPermalink',
        'stock_status': 'stockStatus',
        'currentEp': 1,
        'totalEp': 60,
      },
    ];

    var initialPageIndex = 0;
    if (initialVideoId != null) {
      final video = dummyData
          .firstWhereOrNull((element) => element["id"] == initialVideoId);
      if (video != null) {
        initialPageIndex = dummyData.indexOf(video);
        final removedElement = dummyData.removeAt(initialPageIndex);
        dummyData.insert(0, removedElement);
      }
      // Logger.print("creturn pageIndex to start $initialPageIndex");
    }
    // Logger.print("creturn pageIndex to start ${dummyData}");
    data.assignAll(dummyData);
    updateBrowserUrl();
  }

  void enableAutoPlay() {
    if (autoPlay.value == false) {
      autoPlay.value = true;
    }
  }

  void disableAutoPlay() {
    if (autoPlay.value == true) {
      autoPlay.value = false;
    }
  }

  void updateBrowserUrl([int pageIndex = 0]) async {
    final video = data.elementAt(pageIndex);
    Logger.print(
        "creturn updatebrowserlurl ${'/#${AppRoutes.videos}?id=${video["id"]}'}");
    print(
        "creturn log updatebrowserlurl ${'/#${AppRoutes.videos}?id=${video["id"]}'}");
    html.window.history
        .replaceState(null, "", '/#${AppRoutes.videos}?id=${video["id"]}');
  }

  void returnHome() {
    // AppNavigator.startHome();
    Get.rootDelegate.offNamed(AppRoutes.home);
    // Get.rootDelegate.history.clear();
    // Get.rootDelegate.toNamed(AppRoutes.home);
  }

  void share(VideoModel? video) {
    videoToShare.value = video;
    showShareModal.value = true;
  }

  void closeShare() {
    videoToShare.value = null;
    showShareModal.value = false;
  }

  Future<void> facebookShare() async {
    final linkToShare =
        '${Urls.webUrl}/#${AppRoutes.videos}?id=${videoToShare.value!.id}';
    final url = Uri.parse('${Urls.facebookPost}$linkToShare');

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  Future<void> twitterShare() async {
    final linkToShare =
        '${Urls.webUrl}/#${AppRoutes.videos}?id=${videoToShare.value!.id}';
    final url = Uri.parse('${Urls.twitterPost}$linkToShare');

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  void copyLink() {
    final linkToShare =
        '${Urls.webUrl}/#${AppRoutes.videos}?id=${videoToShare.value!.id}';
    IMUtils.copy(text: linkToShare);
    IMViews.showToast(StrRes.copiedLinkSuccessfully);
  }
}
