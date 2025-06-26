import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isAppTitle;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isAppTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style:
          //  isAppTitle
          //     ? GoogleFonts.pacifico(
          //         fontSize: (fontSize ?? 24).sp,
          //         color: color ?? Colors.black,
          //         fontWeight: fontWeight ?? FontWeight.w500,
          //       )
          //     :
          GoogleFonts.poppins(
            fontSize: (fontSize ?? 14).sp,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
