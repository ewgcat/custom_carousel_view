Language: [English](README.md) | [中文](README_ZH.md)

# custom_carousel_view

## Usage

### 1. Use this package as a library
add custom_carousel_view to dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  carousel_view: any
```

```dart
import 'package:custom_carousel_view/custom_carousel_view.dart';
``````

### Introduction to attribute and meaning
```
attribute                                                 meaning

items                                    子组件数组，一般为图片
hasPagination                            是否展示分页圆点，默认false
pagerSize                                圆点尺寸
passiveIndicator                         未选中圆点颜色
activeIndicator                          选中圆点颜色
passiveDotBorder                         未选中圆点边框
activeDotBorder                          选中圆点边框
height                                   轮播图高度
aspectRatio                              若没有声明高度则使用宽高比，默认16:9
viewportFraction                         每个页面占轮播图宽度的比例，默认0.8
initialPage                              默认选中下标
enableInfiniteScroll                     轮播图是否无限滚动,默认true
autoPlay                                 是否自动播放
reverse                        内容顺序是否反转，默认false，若设置为true，autoPlay也会反向滚动
autoPlayInterval                        自动播放间隔时长，默认4s
autoPlayAnimationDurationautoPlay       设置为true时，自动播放切换动画时长，默认800ms
autoPlayCurve                           动画曲线，默认Curves.fastOutSlowIn
pauseAutoPlayOnTouch                    autoPlay为true时生效，设置一个检测触摸的计时器，在此时长内暂停播放，若不设置此项会发现当自动播放时若通过手势拖动轮播图，轮播图在切换至item后会立即切换到下一个item
scrollPhysics                           当用户取消拖动手势后将如何继续动画（默认根据偏移比例决定是滚动到下一个item还是滚动回上一个item，很少需要设置此项）
enlargeMainPage                         当前item是否高于两侧item，用于增加视觉上的层次感，默认false
onPageChanged                           页面切换回调
```




