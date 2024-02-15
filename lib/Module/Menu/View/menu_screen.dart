import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ElevatedButton(
                child: Text('logout'),
                onPressed: () {
                  MySharedPreferences.deleteUserData();
                  context.goNamed(checkPhoneNumber);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
