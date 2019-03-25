//
//  UIColor+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIColor+SYCategory.h"

@implementation UIColor (SYCategory)

/// 设置颜色透明度
- (UIColor *(^)(CGFloat value))colorAlpha
{
    return ^(CGFloat value) {
        return [self colorWithAlphaComponent:value];
    };
}

/**
 *  将十六进制颜色转换为 UIColor 对象
 *
 *  @param color 十六进制颜色（如@"#ffffff"，或@"0Xffffff"/@"0xffffff"/@"OXffffff"/@"Oxffffff"/@"oXffffff"/@"oxffffff"）
 *
 *  @return UIColor 对象
 */
+ (UIColor *)colorWithHexadecimalString:(NSString *)color
{
    NSString *colorString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (6 > colorString.length) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"] | [colorString hasPrefix:@"0x"] | [colorString hasPrefix:@"OX"] | [colorString hasPrefix:@"Ox"] | [colorString hasPrefix:@"oX"] | [colorString hasPrefix:@"ox"]) {
        colorString = [colorString substringFromIndex:2];
    }
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    if (6 != colorString.length) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *redString = [colorString substringWithRange:range];
    range.location = 2;
    NSString *greenString = [colorString substringWithRange:range];
    range.location = 4;
    NSString *blueString = [colorString substringWithRange:range];
    
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    UIColor *result = [UIColor colorWithRed:((float)(red) / 255.0) green:((float)(green) / 255.0) blue:((float)(blue) / 255.0) alpha:1.0];
    return result;
}

UIColor *UIColorWithHexadecimalString(NSString *color)
{
    return [UIColor colorWithHexadecimalString:color];
}

/// 设置随机颜色
+ (UIColor *)colorRandom
{
    return [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0];
}

/// 设置颜色（RGB：0.0~255.0） 示例：UIColorRGB(100, 100, 100)
+ (UIColor *)colorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UIColor colorRed:red green:green blue:blue alpha:1.0];
}

UIColor *UIColorRGB(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorRed:red green:green blue:blue];
}

/// 设置颜色与透明度（RGB：0.0~255.0；alpha：0.0~1.0） 示例：UIColorRGB_Alpha(100.0, 100.0, 20.0, 1.0)
+ (UIColor *)colorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

UIColor *UIColorRGBAlpha(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
    return [UIColor colorRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - 颜色

/// 浅粉色
+ (UIColor *)lightPickColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFB6C1"];
}

/// 粉色
+ (UIColor *)pinkColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFC0CB"];
}

/// 猩红
+ (UIColor *)crimsonColor
{
    return [UIColor colorWithHexadecimalString:@"0xDC143C"];
}

/// 脸红的淡紫色
+ (UIColor *)lavenderBlushColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFF0F5"];
}

/// 苍白的紫罗兰红色
+ (UIColor *)paleVioletRedColor
{
    return [UIColor colorWithHexadecimalString:@"0xDB7093"];
}

/// 热情的粉红
+ (UIColor *)hotPinkColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF69B4"];
}

/// 深粉色
+ (UIColor *)deepPinkColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF1493"];
}

/// 适中的紫罗兰红色
+ (UIColor *)mediumVioletRedColor
{
    return [UIColor colorWithHexadecimalString:@"0xC71585"];
}

/// 兰花的紫色
+ (UIColor *)orchidColor
{
    return [UIColor colorWithHexadecimalString:@"0xDA70D6"];
}

/// 蓟
+ (UIColor *)thistleColor
{
    return [UIColor colorWithHexadecimalString:@"0xD8BFD8"];
}

/// 李子
+ (UIColor *)plumColor
{
    return [UIColor colorWithHexadecimalString:@"0xDDA0DD"];
}

/// 紫罗兰
+ (UIColor *)violetColor
{
    return [UIColor colorWithHexadecimalString:@"0xEE82EE"];
}

/// 洋红
+ (UIColor *)magentaColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF00FF"];
}

/// 灯笼海棠(紫红色)
+ (UIColor *)fuchsiaColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF00FF"];
}

/// 深洋红色
+ (UIColor *)darkMagentaColor
{
    return [UIColor colorWithHexadecimalString:@"0x8B008B"];
}

/// 紫色
+ (UIColor *)purpleColor
{
    return [UIColor colorWithHexadecimalString:@"0x800080"];
}

/// 适中的兰花紫
+ (UIColor *)mediumOrchidColor
{
    return [UIColor colorWithHexadecimalString:@"0xBA55D3"];
}

/// 深紫罗兰色
+ (UIColor *)darkVoiletColor
{
    return [UIColor colorWithHexadecimalString:@"0x9400D3"];
}

/// 深兰花紫
+ (UIColor *)darkOrchidColor
{
    return [UIColor colorWithHexadecimalString:@"0x9932CC"];
}

/// 靛青
+ (UIColor *)indigoColor
{
    return [UIColor colorWithHexadecimalString:@"0x4B0082"];
}

/// 深紫罗兰的蓝色
+ (UIColor *)blueVioletColor
{
    return [UIColor colorWithHexadecimalString:@"0x8A2BE2"];
}

/// 适中的紫色
+ (UIColor *)mediumPurpleColor
{
    return [UIColor colorWithHexadecimalString:@"0x9370DB"];
}

/// 适中的板岩暗蓝灰色
+ (UIColor *)mediumSlateBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x7B68EE"];
}

/// 板岩暗蓝灰色
+ (UIColor *)slateBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x6A5ACD"];
}

/// 深岩暗蓝灰色
+ (UIColor *)darkSlateBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x483D8B"];
}

/// 熏衣草花的淡紫色
+ (UIColor *)lavenderColor
{
    return [UIColor colorWithHexadecimalString:@"0xE6E6FA"];
}

/// 幽灵的白色
+ (UIColor *)ghostWhiteColor
{
    return [UIColor colorWithHexadecimalString:@"0xF8F8FF"];
}

/// 适中的蓝色
+ (UIColor *)mediumBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x0000CD"];
}

/// 午夜的蓝色
+ (UIColor *)midnightBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x191970"];
}

/// 深蓝色
+ (UIColor *)darkBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x00008B"];
}

/// 海军蓝
+ (UIColor *)navyColor
{
    return [UIColor colorWithHexadecimalString:@"0x000080"];
}

/// 皇家蓝
+ (UIColor *)royalBuleColor
{
    return [UIColor colorWithHexadecimalString:@"0x4169E1"];
}

/// 矢车菊的蓝色
+ (UIColor *)cornflowerBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x6495ED"];
}

/// 淡钢蓝
+ (UIColor *)lightSteelBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0xB0C4DE"];
}

/// 浅石板灰
+ (UIColor *)lightSlateGrayColor
{
    return [UIColor colorWithHexadecimalString:@"0x778899"];
}

/// 石板灰
+ (UIColor *)slateGrayColor
{
    return [UIColor colorWithHexadecimalString:@"0x708090"];
}

/// 道奇蓝
+ (UIColor *)doderBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x1E90FF"];
}

/// 爱丽丝蓝
+ (UIColor *)aliceBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0xF0F8FF"];
}

/// 钢蓝
+ (UIColor *)steelBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x4682B4"];
}

/// 淡蓝色
+ (UIColor *)lightSkyBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x87CEFA"];
}

/// 天蓝色
+ (UIColor *)syeBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x87CEEB"];
}

/// 深天蓝
+ (UIColor *)deepSkyBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x00BFFF"];
}

/// 淡蓝
+ (UIColor *)lightBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0xADD8E6"];
}

/// 火药蓝
+ (UIColor *)powDerBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0xB0E0E6"];
}

/// 军校蓝
+ (UIColor *)cadeBlueColor
{
    return [UIColor colorWithHexadecimalString:@"0x5F9EA0"];
}

/// 蔚蓝色
+ (UIColor *)azureColor
{
    return [UIColor colorWithHexadecimalString:@"0xF0FFFF"];
}

/// 淡青色
+ (UIColor *)lightCyanColor
{
    return [UIColor colorWithHexadecimalString:@"0xE1FFFF"];
}

/// 苍白的绿宝石
+ (UIColor *)paleTurquoiseColor
{
    return [UIColor colorWithHexadecimalString:@"0xAFEEEE"];
}

/// 青色
+ (UIColor *)cyanColor
{
    return [UIColor colorWithHexadecimalString:@"0x00FFFF"];
}

/// 深绿宝石
+ (UIColor *)darkTurquoiseColor
{
    return [UIColor colorWithHexadecimalString:@"0x00CED1"];
}

/// 深石板灰
+ (UIColor *)darkSlateGrayColor
{
    return [UIColor colorWithHexadecimalString:@"0x2F4F4F"];
}

/// 深青色
+ (UIColor *)darkCyanColor
{
    return [UIColor colorWithHexadecimalString:@"0x008B8B"];
}

/// 水鸭色
+ (UIColor *)tealColor
{
    return [UIColor colorWithHexadecimalString:@"0x008080"];
}

/// 适中的绿宝石
+ (UIColor *)mediumTurquoiseColor
{
    return [UIColor colorWithHexadecimalString:@"0x48D1CC"];
}

/// 浅海洋绿
+ (UIColor *)lightSeaGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x20B2AA"];
}

/// 绿宝石
+ (UIColor *)turquoiseColor
{
    return [UIColor colorWithHexadecimalString:@"0x40E0D0"];
}

/// 绿玉\碧绿色
+ (UIColor *)auqamarinColor
{
    return [UIColor colorWithHexadecimalString:@"0x7FFFAA"];
}

/// 适中的碧绿色
+ (UIColor *)mediumAquamarineColor
{
    return [UIColor colorWithHexadecimalString:@"0x00FA9A"];
}

/// 适中的春天的绿色
+ (UIColor *)mediumSpringGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x00FF7F"];
}

/// 薄荷奶油
+ (UIColor *)mintCreamColor
{
    return [UIColor colorWithHexadecimalString:@"0xF5FFFA"];
}

/// 蜂蜜
+ (UIColor *)honeydewColor
{
    return [UIColor colorWithHexadecimalString:@"0xF0FFF0"];
}

/// 春天的绿色
+ (UIColor *)springGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x3CB371"];
}

/// 海洋绿
+ (UIColor *)seaGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x2E8B57"];
}

/// 淡绿色
+ (UIColor *)lightGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x90EE90"];
}

/// 苍白的绿色
+ (UIColor *)paleGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x98FB98"];
}

/// 深海洋绿
+ (UIColor *)darkSeaGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x8FBC8F"];
}

/// 酸橙绿
+ (UIColor *)limeGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x32CD32"];
}

/// 酸橙色
+ (UIColor *)limeColor
{
    return [UIColor colorWithHexadecimalString:@"0x00FF00"];
}

/// 森林绿
+ (UIColor *)forestGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x228B22"];
}

/// 深绿色
+ (UIColor *)darkGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x006400"];
}

/// 查特酒绿
+ (UIColor *)chartreuseColor
{
    return [UIColor colorWithHexadecimalString:@"0x7FFF00"];
}

/// 草坪绿
+ (UIColor *)lawnGreenColor
{
    return [UIColor colorWithHexadecimalString:@"0x7CFC00"];
}

/// 绿黄色
+ (UIColor *)greenYellowColor
{
    return [UIColor colorWithHexadecimalString:@"0xADFF2F"];
}

/// 橄榄土褐色
+ (UIColor *)oliveDrabColor
{
    return [UIColor colorWithHexadecimalString:@"0x556B2F"];
}

/// 米色(浅褐色)
+ (UIColor *)beigeColor
{
    return [UIColor colorWithHexadecimalString:@"0xF5F5DC"];
}

/// 浅秋麒麟黄
+ (UIColor *)lightGoldenrodYellowColor
{
    return [UIColor colorWithHexadecimalString:@"0xFAFAD2"];
}

/// 象牙
+ (UIColor *)ivoryColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFFFF0"];
}

/// 浅黄色
+ (UIColor *)lightYellowColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFFFE0"];
}

/// 橄榄
+ (UIColor *)oliveColor
{
    return [UIColor colorWithHexadecimalString:@"0x808000"];
}

/// 深卡其布
+ (UIColor *)darkKhakiColor
{
    return [UIColor colorWithHexadecimalString:@"0xBDB76B"];
}

/// 柠檬薄纱
+ (UIColor *)lemonChilffonColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFFACD"];
}

/// 灰秋麒麟
+ (UIColor *)paleGodenrodColor
{
    return [UIColor colorWithHexadecimalString:@"0xEEE8AA"];
}

/// 卡其布
+ (UIColor *)khakiColor
{
    return [UIColor colorWithHexadecimalString:@"0xF0E68C"];
}

/// 金
+ (UIColor *)goldColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFD700"];
}

/// 玉米色
+ (UIColor *)cornislkColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFF8DC"];
}

/// 秋麒麟
+ (UIColor *)goldEnrodColor
{
    return [UIColor colorWithHexadecimalString:@"0xDAA520"];
}

/// 花的白色
+ (UIColor *)floralWhiteColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFFAF0"];
}

/// 老饰带
+ (UIColor *)oldLaceColor
{
    return [UIColor colorWithHexadecimalString:@"0xFDF5E6"];
}

/// 小麦色
+ (UIColor *)wheatColor
{
    return [UIColor colorWithHexadecimalString:@"0xF5DEB3"];
}

/// 鹿皮鞋
+ (UIColor *)moccasinColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFE4B5"];
}

/// 番木瓜
+ (UIColor *)papayaWhipColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFB6C1"];
}

/// 漂白的杏仁
+ (UIColor *)blanchedAlmondColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFEBCD"];
}

/// 纳瓦霍白
+ (UIColor *)navajoWhiteColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFDEAD"];
}

/// 古代的白色
+ (UIColor *)antiqueWhiteColor
{
    return [UIColor colorWithHexadecimalString:@"0xFAEBD7"];
}

/// 晒黑
+ (UIColor *)tanColor
{
    return [UIColor colorWithHexadecimalString:@"0xD2B48C"];
}

/// 结实的树
+ (UIColor *)brulyWoodColor
{
    return [UIColor colorWithHexadecimalString:@"0xDEB887"];
}

/// (浓汤)乳脂,番茄等
+ (UIColor *)bisqueColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFE4C4"];
}

/// 深橙色
+ (UIColor *)darkOrangeColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF8C00"];
}

/// 亚麻布
+ (UIColor *)linenColor
{
    return [UIColor colorWithHexadecimalString:@"0xFAF0E6"];
}

/// 秘鲁
+ (UIColor *)peruColor
{
    return [UIColor colorWithHexadecimalString:@"0xCD853F"];
}

/// 桃色
+ (UIColor *)peachPuffColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFDAB9"];
}

/// 沙棕色
+ (UIColor *)sandyBrownColor
{
    return [UIColor colorWithHexadecimalString:@"0xF4A460"];
}

/// 巧克力
+ (UIColor *)chocolateColor
{
    return [UIColor colorWithHexadecimalString:@"0xD2691E"];
}

/// 马鞍棕色
+ (UIColor *)saddleBrownColor
{
    return [UIColor colorWithHexadecimalString:@"0x8B4513"];
}

/// 海贝壳
+ (UIColor *)seaShellColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFF5EE"];
}

/// 黄土赭色
+ (UIColor *)siennaColor
{
    return [UIColor colorWithHexadecimalString:@"0xA0522D"];
}

/// 浅鲜肉(鲑鱼)色
+ (UIColor *)lightSalmonColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFA07A"];
}

/// 珊瑚
+ (UIColor *)coralColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF7F50"];
}

/// 橙红色
+ (UIColor *)orangeRedColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF4500"];
}

/// 深鲜肉(鲑鱼)色
+ (UIColor *)darkSalmonColor
{
    return [UIColor colorWithHexadecimalString:@"0xE9967A"];
}
/// 番茄
+ (UIColor *)tomatoColor
{
    return [UIColor colorWithHexadecimalString:@"0xFF6347"];
}

/// 薄雾玫瑰
+ (UIColor *)mistyRoseColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFE4E1"];
}

/// 鲜肉(鲑鱼)色
+ (UIColor *)salmonColor
{
    return [UIColor colorWithHexadecimalString:@"0xFA8072"];
}

/// 雪
+ (UIColor *)snowColor
{
    return [UIColor colorWithHexadecimalString:@"0xFFFAFA"];
}

/// 淡珊瑚色
+ (UIColor *)lightCoralColor
{
    return [UIColor colorWithHexadecimalString:@"0xF08080"];
}

/// 玫瑰棕色
+ (UIColor *)rosyBrownColor
{
    return [UIColor colorWithHexadecimalString:@"0xBC8F8F"];
}

/// 印度红
+ (UIColor *)indianRedColor
{
    return [UIColor colorWithHexadecimalString:@"0xCD5C5C"];
}

/// 耐火砖
+ (UIColor *)fireBrickColor
{
    return [UIColor colorWithHexadecimalString:@"0xB22222"];
}

/// 深红色
+ (UIColor *)darkRedColor
{
    return [UIColor colorWithHexadecimalString:@"0x8B0000"];
}

/// 栗色
+ (UIColor *)maroonColor
{
    return [UIColor colorWithHexadecimalString:@"0x800000"];
}

/// 白烟
+ (UIColor *)whiteSmokeColor
{
    return [UIColor colorWithHexadecimalString:@"0xF5F5F5"];
}

/// 亮灰色
+ (UIColor *)gainsboroColor
{
    return [UIColor colorWithHexadecimalString:@"0xDCDCDC"];
}

/// 浅灰色
+ (UIColor *)lightGreyColor
{
    return [UIColor colorWithHexadecimalString:@"0xD3D3D3"];
}

/// 银白色
+ (UIColor *)silverColor
{
    return [UIColor colorWithHexadecimalString:@"0xC0C0C0"];
}

/// 深灰色
+ (UIColor *)darkGreyColor
{
    return [UIColor colorWithHexadecimalString:@"0xA9A9A9"];
}

/// 灰色
+ (UIColor *)greyColor
{
    return [UIColor colorWithHexadecimalString:@"0x808080"];
}

/// 暗淡的灰色
+ (UIColor *)dimGrayColor
{
    return [UIColor colorWithHexadecimalString:@"0x696969"];
}


@end
