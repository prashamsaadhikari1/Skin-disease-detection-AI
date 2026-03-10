import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper extends StatelessWidget {
  final String webPageUrl = 'https://creator.voiceflow.com/prototype/66219f09b58990e271028e6c';

  const Helper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a205f),
        title: Text('Helper',style: TextStyle(fontSize: 15.sp,color: Colors.white,fontFamily: GoogleFonts.inter().fontFamily,
    ),),),
      body: InAppWebView(initialUrlRequest:
      URLRequest(url: WebUri("https://creator.voiceflow.com/prototype/66219f09b58990e271028e6c"))
      )
    );
  }
}
