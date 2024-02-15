import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionItem {
  final String title;
  final VoidCallback onPressed;

  ActionItem({required this.title, required this.onPressed});
}

void showCustomCupertinoDialog({
  required BuildContext context,
  required String dialogTitle,
  required List<CupertinoDialogAction> actions,
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          dialogTitle,
          style:
              GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          ...actions,
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel',
                style: GoogleFonts.poppins(
                    fontSize: 12.sp, fontWeight: FontWeight.w500)),
          ),
        ],
      );
    },
  );
}
