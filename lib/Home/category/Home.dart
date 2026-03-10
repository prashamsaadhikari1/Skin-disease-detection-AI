import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Drawer/WidgetsListView/About.dart';
import 'Drawer/WidgetsListView/helper.dart';
import 'WidgetsHome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Drawer/ListView/Drawer.dart';
import 'Drawer/WidgetsListView/DrawerHistory.dart';

class Home extends StatefulWidget {
  final String? userEmail;

  Home({Key? key, this.userEmail}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  SharedPreferences? _prefs;
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = widget.userEmail ?? '';
    });
    final String uniqueKey = 'user_$_userEmail';
    final String? savedEmail = _prefs?.getString(uniqueKey);
    if (savedEmail != null && savedEmail.isNotEmpty) {
      setState(() {
        _userEmail = savedEmail;
      });
    } else {
      await _prefs?.setString(uniqueKey, _userEmail);
    }
    final String? savedImagePath = _prefs?.getString('imagePath_$uniqueKey');
    if (savedImagePath != null) {
      setState(() {
        _image = File(savedImagePath);
      });
    }
  }

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _saveImagePermanently(_image!);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _saveImagePermanently(File imageFile) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String imageDirPath = '${appDocDir.path}/images';
    final Directory imageDir = Directory(imageDirPath);
    if (!await imageDir.exists()) {
      await imageDir.create(recursive: true);
    }
    final String uniqueKey = 'user_$_userEmail';
    final String imagePath = '$imageDirPath/image_${DateTime.now()}.png';
    await imageFile.copy(imagePath);
    print('Image saved to: $imagePath');

    _prefs?.setString('imagePath_$uniqueKey', imagePath);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      drawer: Drawer(
        width: 180.w,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff4a205f),
              ),
              currentAccountPicture: GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('lib/Assets/icons8-user-64.png') as ImageProvider<Object>?,
                      radius: 38.sp,
                    ),
                  ),
                ),
              ),
              accountName: Text(''),
              accountEmail: Text('$_userEmail', style: TextStyle(fontSize: 15.sp)),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.purple,
                      size: 22.sp,
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(userEmail: _userEmail),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.chat_outlined,
                      color: Colors.purple,
                      size: 22.sp,
                    ),
                    title: Text(
                      'helper',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Helper(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.error_outline,
                      color: Colors.purple,
                      size: 22.sp,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => About(),
                        ),
                      );
                    },
                  ),
                  DrawerView(userEmail: _userEmail),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.menu, size: 24.sp, color: Colors.grey.shade700),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.black, fontSize: 16.sp, fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              WidgetsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
