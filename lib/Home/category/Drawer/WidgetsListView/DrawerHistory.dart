import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatefulWidget {
  final String? userEmail;

  HistoryPage({Key? key, this.userEmail}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<List<String>> _getResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> resultList = prefs.getStringList('results') ?? [];
    resultList = resultList.reversed.toList();
    return resultList;
  }

  Future<void> _deleteAllResults(BuildContext context) async {
    _confirmDeleteAll(context);
  }

  void _confirmDelete(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Delete',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.inter().fontFamily),
          ),
          content: Text('Are you sure you want to delete this record ?', style: TextStyle(fontSize: 12,fontFamily: GoogleFonts.inter().fontFamily)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No',style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily),),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                backgroundColor: Color(0xff4a205f),
              ),
              onPressed: () {
                _deleteRecord(context, result);
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white,fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteAll(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Delete All',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.inter().fontFamily),
          ),
          content: Text('Are you sure you want to delete all records ?', style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                backgroundColor: Color(0xff4a205f),
              ),
              onPressed: () {
                _deleteAllRecords(context);
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteRecord(BuildContext context, String result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> results = prefs.getStringList('results') ?? [];
    results.remove(result);
    await prefs.setStringList('results', results);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 20.sp,
                color: Colors.green,
              ),
              SizedBox(width: 10.0.w),
              Text(
                'Result deleted successfully!',
                style: TextStyle(color: Colors.white,fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ],
          ),
          duration: Duration(seconds: 2),
        )
    );
  }

  Future<void> _deleteAllRecords(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('results');
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 20.sp,
                color: Colors.green,
              ),
              SizedBox(width: 10.0.w),
              Text(
                'All result deleted successfully!',
                style: TextStyle(color: Colors.white,fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ],
          ),
          duration: Duration(seconds: 2),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'History',
            style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: GoogleFonts.inter().fontFamily),
          ),
          backgroundColor: Color(0xff4a205f),
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text(
                    'Delete All',
                    style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily),
                  ),
                  value: 'delete_all',
                ),
              ],
              onSelected: (value) {
                if (value == 'delete_all') {
                  _deleteAllResults(context);
                }
              },
            ),
          ],
        ),
        body: FutureBuilder<List<String>>(
        future: _getResults(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
    List<String> results = snapshot.data ?? [];
    if (results.isEmpty) {
    return Center(
    child: Text(
    'No results found !',
      style: TextStyle(fontSize: 15.sp,fontFamily: GoogleFonts.inter().fontFamily),
    ),

    );
    } else {
      return ListView.separated(
        itemCount: results.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              results[index],
              style: TextStyle(fontSize: 12.sp,fontFamily: GoogleFonts.inter().fontFamily),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline_outlined,color: Colors.purple,),
              onPressed: () {
                _confirmDelete(context, results[index]);
              },
            ),
          );
        },
      );
    }
    }
    },
        ),
    );
  }
}
