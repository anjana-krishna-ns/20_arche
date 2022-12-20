
import 'package:arche_org/screens/Home_page/firebase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_all/new_project/Sign_in/log_in.dart';
import '../../test_all/share_test/logout.dart';
import '../Login/sign_in.dart';
class My_profile extends StatefulWidget {
  @override
  _My_profileState createState() => _My_profileState();
}
class _My_profileState extends State<My_profile> {
  SharedPreferences ? logindata;
  String ?username;
  String ? email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      // email=logindata.getString('email')!;
      username = logindata?.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Welcome  $username',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  logindata!.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => signinn()));
                },
                child: Text('LogOut'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
