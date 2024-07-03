


///获取视频列表的状态
enum DataLoadState{
  loading,
  success,
  noData,
  noMore,
  error,
}


///当前所播放的视频的业务状态
///这里定义了常规的状态
///需vip、需付费、需看广告、免费、试看
enum ServicePlayState{
  loading,//加载中
  error,//获取失败
  free,//免费
  see,//试看
  needVip,//需要vip
  needPurchase,//需要购买
  needAdv,//需要看广告
}

///当前所播放的视频的加载状态
enum PlayState{
  idle,
  loading,
  playing,
  pause,
  buffering,
  dispose,
  error
}

///获取视频链接的状态，该类主要是增加一个url
///当获取成功时，应该会有一个播放链接
class ServicePlayStateVo{
  ServicePlayState state;
  String? url;
  ServicePlayStateVo({required this.state,this.url});
}
