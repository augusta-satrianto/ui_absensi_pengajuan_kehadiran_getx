import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

import '../../config/methods.dart';

class CustomUploadImagePath extends StatefulWidget {
  final String title;
  final TextEditingController controllerImage;
  const CustomUploadImagePath(
      {super.key, required this.title, required this.controllerImage});

  @override
  State<CustomUploadImagePath> createState() => _CustomUploadImagePathState();
}

class _CustomUploadImagePathState extends State<CustomUploadImagePath> {
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final image = await selectImage();
            setState(() {
              selectedImage = image;
              widget.controllerImage.text = basename(selectedImage!.path);
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: const Color(0xFFC1C2C4).withOpacity(0.20),
                      width: 1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/ic_document_colored.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Unggah Dokumen',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 11, color: neutral600)),
                    const Spacer(),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/ic_paper.png',
                      width: 24,
                    )
                  ],
                ),
                selectedImage != null
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 34,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.controllerImage.text,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    fontWeight: bold,
                                    color: neutral600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 90,
                                height: 135,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 6),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(selectedImage!.path),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
