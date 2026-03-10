import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ResultBurn/Result_burn.dart';

class SkinBurns extends StatefulWidget {
  @override
  State<SkinBurns> createState() => _SkinBurnsState();
}

class _SkinBurnsState extends State<SkinBurns> {
  final picker = ImagePicker();
  File? img;
  var url = "https://skin-burn-app-production.up.railway.app/predictApi";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> pickImageFromGallery() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
      });
      await upload();
    }
  }

  Future<void> takePicture() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
      });
      await upload();
    }
  }

  Future<void> upload() async {
    if (img == null) {
      return;
    }
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('fileup', img!.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final resJson = jsonDecode(await response.stream.bytesToString());
      print("response here: $resJson");
      if (resJson != null && resJson['Error'] != null) {
        String error = resJson['Error'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade500,
            content: Row(
              children: [
                Text(
                  error,
                  style: TextStyle(fontSize: 12.sp,color: Colors.black,fontFamily: GoogleFonts.inter().fontFamily),
                ),
                Expanded(child: SizedBox()),
                Icon(Icons.details_rounded, color: Colors.yellow.shade500),
              ],
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultBurn(result: "", image: null)),
        );
      } else {
        String result = resJson['prediction'];
        if (result.isNotEmpty) {
          _saveResult(result);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultBurn(result: result, image: img),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultBurn(result: "", image: null)),
          );
        }
      }
    } else {
      print("Error ${response.statusCode}");
    }
  }
  void _saveResult(String result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> results = prefs.getStringList('results') ?? [];
    results.add(result);
    await prefs.setStringList('results', results);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Skin Burns',
          style: TextStyle(color: Colors.white, fontSize: 15.sp,
            fontFamily: GoogleFonts.inter().fontFamily,),
        ),
        backgroundColor: Color(0xff4a205f),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/7ae7be56-26d4-4d9f-87e0-406c40cffa7d/F3FQ8XZPOz.json',
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(height: 50.h),
              ElevatedButton(
                onPressed: takePicture,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4a205f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  minimumSize: Size(double.infinity, 48.h),
                ),
                child: Text(
                  'Take Picture',
                  style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.inter().fontFamily),
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: pickImageFromGallery,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4a205f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  minimumSize: Size(double.infinity, 48.h),
                ),
                child: Text(
                  'Choose an image',
                  style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.inter().fontFamily),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

