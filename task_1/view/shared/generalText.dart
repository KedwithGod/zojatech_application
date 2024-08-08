import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight? textFontWeight;
  final int? noOfTextLine;
  final String? textSemanticLabel;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;
  final List<Shadow>? shadow;

  const GeneralTextDisplay(this.inputText,
      {super.key,
      this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      this.textDecoration,
      this.shadow,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
            // add line height to the text widget if the design look different
            color:textColor?? const Color.fromRGBO(0, 0, 0, 1),
            letterSpacing: letterSpacing ?? 0.02,
            fontSize: textFontSize??14,
            shadows: shadow ?? [],
            fontWeight: textFontWeight??FontWeight.w400,
            decoration: textDecoration ?? TextDecoration.none,
            decorationColor: decorationColor??const Color.fromRGBO(0, 0, 0, 1) ,
            decorationStyle: TextDecorationStyle.solid),
      ),
      maxLines: noOfTextLine??1,
      semanticsLabel: textSemanticLabel??'',
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// rubik text


// text span\
