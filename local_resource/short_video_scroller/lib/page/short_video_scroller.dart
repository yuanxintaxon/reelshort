import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:short_video_scroller/model/video_model.dart';
import 'package:short_video_scroller/page/video_page.dart';

class ShortVideoScroller extends StatefulWidget {
  /// Create Video Player Layout Like Tiktok.
  ///
  /// The listData, pageSize, loadMore are required.
  ///
  /// The others arguments use for custom UI (not required),
  ///
  /// if you want to hide them, you can return SizeBox.shrink().
  ///
  /// Note: the [listData] is a list of Map, each Map is a Video object and
  ///
  /// video object required some field of data like this:
  ///
  /// ```dart
  /// {
  ///   'id': 123,
  ///   'url': 'https://video.mp4',
  ///   'thumbnail': 'https://thumbnail.jpg',
  ///   'likes': 100,
  ///   'liked': true,
  /// }
  /// ```
  ///
  /// Please follow above format data.
  ///
  /// The [pageSize] is size of list data every time load more data,
  ///
  /// it affects when to load more data.
  ///
  /// The loadMore is a function to load more data,
  ///
  /// it is called every time current PageView is at position:
  ///
  /// [listData.length] - ([pageSize]/2)
  ///
  /// Example:
  ///
  /// ```dart
  /// ShortVideoScroller(
  ///       listData: data,
  ///       pageSize: 10,
  ///       loadMore: (){
  ///         debugPrint("load more...");
  ///         setState(() {
  ///           data = [...data, ...playList];
  ///         });
  ///       }
  ///  )
  ///
  /// ```
  const ShortVideoScroller({
    Key? key,
    required this.listData,
    this.customVideoInfo,
    this.followWidget,
    this.likeWidget,
    this.commentWidget,
    this.shareWidget,
    this.buyWidget,
    this.viewWidget,
    required this.pageSize,
    required this.loadMore,
    this.informationPadding,
    required this.videoWatched,
    this.lastSeenPage,
    this.actionsPadding,
    this.informationAlign,
    this.actionsAlign,
    this.updateLastSeenPage,
    this.onPageChanged,
    this.onPlaying,
    this.onBack,
    this.enableBackgroundContent,
    this.autoPlay,
  }) : super(key: key);

  /// Index of last seen page.
  ///
  /// If [lastSeenPage] has value: initial page of video page view is [lastSeenPage].
  ///
  /// Default value is 0.
  final int? lastSeenPage;

  /// Callback function to update last seen page.
  ///
  /// Called every time video page is changed.
  final Function(int lastSeenPage)? updateLastSeenPage;

  /// Callback function to update page changed.
  ///
  /// Called every time a page is changed.
  final Function(int pageIndex)? onPageChanged;

  /// Callback function when video is played
  ///
  /// Called every time a video is palyed
  final Function()? onPlaying;

  /// Callback function when back button is clicked
  ///
  /// Called every time a back button is clicked
  final Function()? onBack;

  /// Id of your watched videos.
  ///
  /// The [videoWatched] will be updated every time new video is watched.
  final List<String> videoWatched;

  /// Your input data.
  ///
  /// Data must be a List<Map<String, dynamic>.
  ///
  /// Follow this format data:
  ///
  /// ```dart
  /// {
  ///   'id': 123,
  ///   'url': 'https://video.mp4',
  ///   'thumbnail': 'https://thumbnail.jpg',
  ///   'likes': 100,
  ///   'liked': true,
  ///   'description': 'this is description'
  ///   'video_title': this is title of video'
  /// }
  /// ```
  final List<Map<String, dynamic>> listData;

  /// Your pageSize when you call get-list API.
  final int pageSize;

  /// Load more data.
  ///
  /// It is called every time current PageView is at position:
  ///
  /// [listData.length] - ([pageSize]/2)
  ///
  /// The first argument is current page of video list (start at 0),
  ///
  /// it depends on [pageSize].
  ///
  /// The seconds argument is your [pageSize]
  final Function(int page, int pageSize) loadMore;

  /// Alignment of video information.
  final AlignmentGeometry? informationAlign;

  /// Alignment of video actions.
  final AlignmentGeometry? actionsAlign;

  /// Padding of video actions.
  final EdgeInsetsGeometry? actionsPadding;

  /// Padding of video information.
  final EdgeInsetsGeometry? informationPadding;

  /// Create video information widget.
  final Widget Function(VideoModel? video)? customVideoInfo;

  /// Create follow action widget.
  final Widget Function(VideoModel? video)? followWidget;

  /// Create like action widget.
  ///
  /// The first argument is instant of Video.
  ///
  /// The second argument is function to update data,
  ///
  /// this function receives two argument:
  ///
  /// first is total likes, second is liked status (true or false)
  ///
  /// this function need be called when total likes or liked status be changed
  final Widget Function(VideoModel? video, Function(int likes, bool liked))?
      likeWidget;

  /// Create action comment widget.
  final Widget Function(VideoModel? video)? commentWidget;

  /// Create action share widget.
  final Widget Function(VideoModel? video)? shareWidget;

  /// Create action buy widget.
  final Widget Function(VideoModel? video)? buyWidget;

  /// Create action view product widget
  final Widget Function(VideoModel? video, int index)? viewWidget;

  /// On/Off background content.
  ///
  /// If `enableBackgroundContent = true` background is showed,
  ///
  /// if value is null or false, background is hidden
  final bool? enableBackgroundContent;

  /// On/Off auto play
  final bool? autoPlay;

  @override
  State<ShortVideoScroller> createState() => _ShortVideoScrollerState();
}

class _ShortVideoScrollerState extends State<ShortVideoScroller> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.lastSeenPage ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Handle load more.
    _pageController.addListener(() {
      if (_pageController.page != null) {
        if (_pageController.page!.round() != currentPage) {
          currentPage = _pageController.page!.round();
          if (currentPage == widget.listData.length - (widget.pageSize / 2)) {
            widget.loadMore(
              (currentPage ~/ widget.pageSize),
              widget.pageSize,
            );
          }
        }
      }
    });
    if (widget.listData.isEmpty) {
      return Container(
          color: Colors.black,
          child: const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          ));
    }
    return PageView(
      controller: _pageController,
      onPageChanged: widget.onPageChanged,
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      children: List.generate(
        widget.listData.length,
        (index) => VideoPage(
          autoPlay: widget.autoPlay ?? false,
          updateLastSeenPage: widget.updateLastSeenPage,
          onPlaying: widget.onPlaying,
          onBack: widget.onBack,
          video: VideoModel.fromJson(widget.listData[index]),
          customVideoInfo: widget.customVideoInfo,
          followWidget: widget.followWidget,
          likeWidget: widget.likeWidget,
          commentWidget: widget.commentWidget,
          shareWidget: widget.shareWidget,
          buyWidget: widget.buyWidget,
          videoWatched: widget.videoWatched,
          actionsAlign: widget.actionsAlign,
          actionsPadding: widget.actionsPadding,
          informationAlign: widget.informationAlign,
          informationPadding: widget.informationPadding,
          viewWidget: widget.viewWidget,
          index: index,
        ),
      ),
    );
  }
}
