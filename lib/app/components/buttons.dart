import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  const CustomFilledButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.height = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryMain, borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
