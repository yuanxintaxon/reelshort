## 说明
这是一个视频预加载的解决方案，提供丰富的接口与您的业务交互。
一个最简单的例子：

![The example app running in Android](https://github.com/tuhao-world/preload_video/blob/main/aaa.gif)

## 导入依赖
dependencies: preload_video: ^last_version

## 使用
#### 前提条件1：
您需要创建一个视频模型类，该类需继承自VideoVo，且反序列化时，需要赋值
给VideoVo的所有基础属性。如：
```dart
class HomeVo extends VideoVo{
  int? id;
  HomeVo({this.id});
  factory HomeVo.fromJson(Map<String, dynamic> json){
    return HomeVo().fromMap(json);
  }
  @override
  fromMap(element) {
    id = element?['id'];
    title = element?['worksTitle'];
    coverUrl = element?['coverUrl'];
    subTitle = element?['worksIntro'];
    playUrl = element?['playUrl'];
    return this;
  }
}
```

#### 前提条件2：
您需要创建一个数据操作的中间件（model），可以是Getx、provider等状态管理的子类，如：
```dart
class HomeModel extends VideoModel<HomeVo>{
  @override
  Future<DataLoadState> loadData({bool loadMore = false}) {
    //这里是放你获取视频列表的业务
  }
}
```

#### 开始使用：
```dart
PreloadVideo<HomeVo, HomeModel>(
  model: HomeModel(),
)
```

PreloadVideo的可选参数说明，请看源码的注视。

#### 捐助
若能资助，我将投入更多时间设计更多服务于开发者的插件。非常谢谢！


![wechat](https://github.com/tuhao-world/preload_video/blob/main/IMG_202403111469_300x300.jpg)