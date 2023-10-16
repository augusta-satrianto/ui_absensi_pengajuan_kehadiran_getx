import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/app/modules/pengajuan_cuti/controllers/pengajuan_cuti_controller.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/app/modules/pengajuan_kehadiran/controllers/pengajuan_kehadiran_controller.dart';
import 'package:ui_absensi_pengajuan_kehadiran_getx/config/theme.dart';

import '../../config/methods.dart';

class CustomUploadImagePath extends StatefulWidget {
  final String title;
  final TextEditingController controllerImage;
  const CustomUploadImagePath({
    super.key,
    required this.title,
    required this.controllerImage,
  });

  @override
  State<CustomUploadImagePath> createState() => _CustomUploadImagePathState();
}

class _CustomUploadImagePathState extends State<CustomUploadImagePath> {
  XFile? selectedImage;
  final pengajuanKehadiranController = Get.put(PengajuanKehadiranController());
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
              if (selectedImage != null) {
                pengajuanKehadiranController
                    .changeNameDokumen(basename(selectedImage!.path));
                widget.controllerImage.text = basename(selectedImage!.path);
              }
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
                      'assets/images/ic_document_colored.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Unggah Dokumen',
                        style: plusJakartaSansTextStyle.copyWith(
                            fontSize: 11, color: neutral600)),
                    const Spacer(),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/ic_paper.png',
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
                                style: plusJakartaSansTextStyle.copyWith(
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

class CustomUploadFilePath extends StatefulWidget {
  final TextEditingController controllerFile;
  const CustomUploadFilePath({super.key, required this.controllerFile});

  @override
  State<CustomUploadFilePath> createState() => _CustomUploadFilePathState();
}

class _CustomUploadFilePathState extends State<CustomUploadFilePath> {
  File? pathFile;
  final pengajuanCutiController = Get.put(PengajuanCutiController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final resultFile = await selectFile();
            if (resultFile == null) return;
            pengajuanCutiController
                .changeNameFile(resultFile.files.single.name);
            setState(() {
              widget.controllerFile.text = resultFile.files.single.name;
              pathFile = File(resultFile.files.single.path.toString());
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
                      'assets/images/ic_plus_colored.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Unggah File',
                        style: plusJakartaSansTextStyle.copyWith(
                            fontSize: 11, color: neutral600)),
                    const Spacer(),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/ic_paper.png',
                      width: 24,
                    )
                  ],
                ),
                widget.controllerFile.text != ''
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
                                widget.controllerFile.text,
                                style: plusJakartaSansTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: bold,
                                    color: neutral600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PreviewPdf(
                                                path: pathFile!.path.toString(),
                                                nameFile:
                                                    widget.controllerFile.text,
                                              )));
                                },
                                child: Text(
                                  'Preview >',
                                  style: plusJakartaSansTextStyle.copyWith(
                                      color: neutral300, fontSize: 11),
                                ),
                              )
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

class PreviewPdf extends StatelessWidget {
  final String path;
  final String nameFile;
  const PreviewPdf({super.key, required this.path, required this.nameFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameFile),
        titleTextStyle: plusJakartaSansTextStyle.copyWith(
            color: neutral600, fontSize: 20, fontWeight: semiBold),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(color: Color(0xFF45484F)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: PDFView(
        filePath: path,
      ),
    );
  }
}
