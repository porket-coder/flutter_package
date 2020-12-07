import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import '../../utils/z_color_util.dart';

/// @author zdl
/// date 2020/12/7 11:26
/// email zdl328465042@163.com
/// description 通用左右显示布局
class ZShowInfoRow extends StatelessWidget {
  final String keyStr;
  final double keyFontSize;
  final Color keyFontColor;
  final FontWeight keyFontWeight;
  final int keyFlex;
  final String valueStr;
  final double valueFontSize;
  final Color valueFontColor;
  final FontWeight valueFontWeight;
  final int valueFlex;
  final int valueMaxLine;

  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color bgColor;
  final bool valueIsEnd;
  final double centerSpace;
  final bool hasDivider;
  final Color dividerColor;
  final EdgeInsets dividerMargin;

  const ZShowInfoRow({
    this.keyStr = '',
    this.keyFontSize = 14,
    this.keyFontColor = ZColorUtil.color_333,
    this.keyFontWeight = FontWeight.w600,
    this.keyFlex = 1,
    this.valueStr = '',
    this.valueFontSize = 14,
    this.valueFontColor = ZColorUtil.color_666,
    this.valueFontWeight = FontWeight.normal,
    this.valueFlex = 2,
    this.valueMaxLine = 1,
    this.padding,
    this.margin,
    this.bgColor,
    this.valueIsEnd = true,
    this.centerSpace = 10,
    this.hasDivider = true,
    this.dividerColor =  Colors.grey,
    this.dividerMargin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    var content;
    content = Container(
      padding: padding,
      margin: margin,
      color: bgColor,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: keyFlex,
            child: Text(
              keyStr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: keyFontColor,
                fontSize: keyFontSize,
                fontWeight: keyFontWeight,
              ),
            ),
          ),
          SizedBox(width: centerSpace),
          Expanded(
            flex: valueFlex,
            child: Text(
              valueStr,
              textAlign: valueIsEnd ? TextAlign.end : TextAlign.start,
              maxLines: valueMaxLine,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: valueFontColor,
                fontSize: valueFontSize,
                fontWeight: valueFontWeight,
              ),
            ),
          ),
        ],
      ),
    );
    if(hasDivider){
      content = Column(
        children: [
          content,
          ZLine(bgColor: bgColor, lineColor: dividerColor, margin: dividerMargin,),
        ],
      );
    }
    return content;
  }
}
