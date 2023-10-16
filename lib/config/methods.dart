import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}

// File? _fileFile;
Future<FilePickerResult?> selectFile() async {
  FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      // type: FileType.custom, allowedExtensions: ['jpg', 'png', 'pdf']);
      type: FileType.custom,
      allowedExtensions: ['pdf']);
  return resultFile;
}
