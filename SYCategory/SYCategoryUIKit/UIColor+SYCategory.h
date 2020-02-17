//
//  UIColor+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SYCategory)

/// 设置颜色透明度
- (UIColor *(^)(CGFloat value))colorAlpha;

/**
 *  将十六进制颜色转换为 UIColor 对象
 *
 *  @param color 十六进制颜色（如@"#ffffff"，或@"0Xffffff"/@"0xffffff"/@"OXffffff"/@"Oxffffff"/@"oXffffff"/@"oxffffff"）
 *
 *  @return UIColor 对象
 */
+ (UIColor *)colorWithHexadecimalString:(NSString *)color;

/// 设置随机颜色
+ (UIColor *)colorRandom;

/// 设置颜色（RGB：0.0~255.0） 示例：UIColorRGB(100, 100, 100)
+ (UIColor *)colorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/// 设置颜色与透明度（RGB：0.0~255.0；alpha：0.0~1.0） 示例：UIColorRGB_Alpha(100.0, 100.0, 20.0, 1.0)
+ (UIColor *)colorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

#pragma mark - 颜色

/// 浅粉色
+ (UIColor *)lightPickColor;

/// 粉色
+ (UIColor *)pinkColor;

/// 猩红
+ (UIColor *)crimsonColor;

/// 脸红的淡紫色
+ (UIColor *)lavenderBlushColor;

/// 苍白的紫罗兰红色
+ (UIColor *)paleVioletRedColor;

/// 热情的粉红
+ (UIColor *)hotPinkColor;

/// 深粉色
+ (UIColor *)deepPinkColor;

/// 适中的紫罗兰红色
+ (UIColor *)mediumVioletRedColor;

/// 兰花的紫色
+ (UIColor *)orchidColor;

/// 蓟
+ (UIColor *)thistleColor;

/// 李子
+ (UIColor *)plumColor;

/// 紫罗兰
+ (UIColor *)violetColor;

/// 洋红
+ (UIColor *)magentaColor;

/// 灯笼海棠(紫红色)
+ (UIColor *)fuchsiaColor;

/// 深洋红色
+ (UIColor *)darkMagentaColor;

/// 紫色
+ (UIColor *)purpleColor;

/// 适中的兰花紫
+ (UIColor *)mediumOrchidColor;

/// 深紫罗兰色
+ (UIColor *)darkVoiletColor;

/// 深兰花紫
+ (UIColor *)darkOrchidColor;

/// 靛青
+ (UIColor *)indigoColor;

/// 深紫罗兰的蓝色
+ (UIColor *)blueVioletColor;

/// 适中的紫色
+ (UIColor *)mediumPurpleColor;

/// 适中的板岩暗蓝灰色
+ (UIColor *)mediumSlateBlueColor;

/// 板岩暗蓝灰色
+ (UIColor *)slateBlueColor;

/// 深岩暗蓝灰色
+ (UIColor *)darkSlateBlueColor;

/// 熏衣草花的淡紫色
+ (UIColor *)lavenderColor;

/// 幽灵的白色
+ (UIColor *)ghostWhiteColor;

/// 适中的蓝色
+ (UIColor *)mediumBlueColor;

/// 午夜的蓝色
+ (UIColor *)midnightBlueColor;

/// 深蓝色
+ (UIColor *)darkBlueColor;

/// 海军蓝
+ (UIColor *)navyColor;

/// 皇家蓝
+ (UIColor *)royalBuleColor;

/// 矢车菊的蓝色
+ (UIColor *)cornflowerBlueColor;

/// 淡钢蓝
+ (UIColor *)lightSteelBlueColor;

/// 浅石板灰
+ (UIColor *)lightSlateGrayColor;

/// 石板灰
+ (UIColor *)slateGrayColor;

/// 道奇蓝
+ (UIColor *)doderBlueColor;
/// 爱丽丝蓝
+ (UIColor *)aliceBlueColor;

/// 钢蓝
+ (UIColor *)steelBlueColor;

/// 淡蓝色
+ (UIColor *)lightSkyBlueColor;

/// 天蓝色
+ (UIColor *)syeBlueColor;

/// 深天蓝
+ (UIColor *)deepSkyBlueColor;

/// 淡蓝
+ (UIColor *)lightBlueColor;

/// 火药蓝
+ (UIColor *)powDerBlueColor;

/// 军校蓝
+ (UIColor *)cadeBlueColor;

/// 蔚蓝色
+ (UIColor *)azureColor;

/// 淡青色
+ (UIColor *)lightCyanColor;

/// 苍白的绿宝石
+ (UIColor *)paleTurquoiseColor;

/// 青色
+ (UIColor *)cyanColor;

/// 深绿宝石
+ (UIColor *)darkTurquoiseColor;

/// 深石板灰
+ (UIColor *)darkSlateGrayColor;

/// 深青色
+ (UIColor *)darkCyanColor;

/// 水鸭色
+ (UIColor *)tealColor;

/// 适中的绿宝石
+ (UIColor *)mediumTurquoiseColor;

/// 浅海洋绿
+ (UIColor *)lightSeaGreenColor;

/// 绿宝石
+ (UIColor *)turquoiseColor;

/// 绿玉\碧绿色
+ (UIColor *)auqamarinColor;

/// 适中的碧绿色
+ (UIColor *)mediumAquamarineColor;

/// 适中的春天的绿色
+ (UIColor *)mediumSpringGreenColor;

/// 薄荷奶油
+ (UIColor *)mintCreamColor;

/// 蜂蜜
+ (UIColor *)honeydewColor;

/// 春天的绿色
+ (UIColor *)springGreenColor;

/// 海洋绿
+ (UIColor *)seaGreenColor;

/// 淡绿色
+ (UIColor *)lightGreenColor;

/// 苍白的绿色
+ (UIColor *)paleGreenColor;

/// 深海洋绿
+ (UIColor *)darkSeaGreenColor;

/// 酸橙绿
+ (UIColor *)limeGreenColor;

/// 酸橙色
+ (UIColor *)limeColor;

/// 森林绿
+ (UIColor *)forestGreenColor;

/// 深绿色
+ (UIColor *)darkGreenColor;

/// 查特酒绿
+ (UIColor *)chartreuseColor;

/// 草坪绿
+ (UIColor *)lawnGreenColor;

/// 绿黄色
+ (UIColor *)greenYellowColor;

/// 橄榄土褐色
+ (UIColor *)oliveDrabColor;

/// 米色(浅褐色)
+ (UIColor *)beigeColor;

/// 浅秋麒麟黄
+ (UIColor *)lightGoldenrodYellowColor;

/// 象牙
+ (UIColor *)ivoryColor;

/// 浅黄色
+ (UIColor *)lightYellowColor;

/// 橄榄
+ (UIColor *)oliveColor;

/// 深卡其布
+ (UIColor *)darkKhakiColor;

/// 柠檬薄纱
+ (UIColor *)lemonChilffonColor;

/// 灰秋麒麟
+ (UIColor *)paleGodenrodColor;

/// 卡其布
+ (UIColor *)khakiColor;

/// 金
+ (UIColor *)goldColor;

/// 玉米色
+ (UIColor *)cornislkColor;

/// 秋麒麟
+ (UIColor *)goldEnrodColor;

/// 花的白色
+ (UIColor *)floralWhiteColor;

/// 老饰带
+ (UIColor *)oldLaceColor;

/// 小麦色
+ (UIColor *)wheatColor;

/// 鹿皮鞋
+ (UIColor *)moccasinColor;

/// 番木瓜
+ (UIColor *)papayaWhipColor;

/// 漂白的杏仁
+ (UIColor *)blanchedAlmondColor;

/// 纳瓦霍白
+ (UIColor *)navajoWhiteColor;

/// 古代的白色
+ (UIColor *)antiqueWhiteColor;

/// 晒黑
+ (UIColor *)tanColor;

/// 结实的树
+ (UIColor *)brulyWoodColor;

/// (浓汤)乳脂,番茄等
+ (UIColor *)bisqueColor;

/// 深橙色
+ (UIColor *)darkOrangeColor;

/// 亚麻布
+ (UIColor *)linenColor;

/// 秘鲁
+ (UIColor *)peruColor;

/// 桃色
+ (UIColor *)peachPuffColor;

/// 沙棕色
+ (UIColor *)sandyBrownColor;

/// 巧克力
+ (UIColor *)chocolateColor;

/// 马鞍棕色
+ (UIColor *)saddleBrownColor;

/// 海贝壳
+ (UIColor *)seaShellColor;

/// 黄土赭色
+ (UIColor *)siennaColor;

/// 浅鲜肉(鲑鱼)色
+ (UIColor *)lightSalmonColor;

/// 珊瑚
+ (UIColor *)coralColor;

/// 橙红色
+ (UIColor *)orangeRedColor;

/// 深鲜肉(鲑鱼)色
+ (UIColor *)darkSalmonColor;

/// 番茄
+ (UIColor *)tomatoColor;

/// 薄雾玫瑰
+ (UIColor *)mistyRoseColor;

/// 鲜肉(鲑鱼)色
+ (UIColor *)salmonColor;

/// 雪
+ (UIColor *)snowColor;

/// 淡珊瑚色
+ (UIColor *)lightCoralColor;

/// 玫瑰棕色
+ (UIColor *)rosyBrownColor;

/// 印度红
+ (UIColor *)indianRedColor;

/// 耐火砖
+ (UIColor *)fireBrickColor;

/// 深红色
+ (UIColor *)darkRedColor;

/// 栗色
+ (UIColor *)maroonColor;

/// 白烟
+ (UIColor *)whiteSmokeColor;

/// 亮灰色
+ (UIColor *)gainsboroColor;

/// 浅灰色
+ (UIColor *)lightGreyColor;

/// 银白色
+ (UIColor *)silverColor;

/// 深灰色
+ (UIColor *)darkGreyColor;

/// 灰色
+ (UIColor *)greyColor;

/// 暗淡的灰色
+ (UIColor *)dimGrayColor;

@end
