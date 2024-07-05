// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/colors/base_color.dart';
// import 'package:suzumakukar/src/presentation/pages/profile/updateImg/update_img_viewmodel.dart';

// class UpdateImgContent extends StatefulWidget {
//   final UpdateImgViewModel vm;
//   const UpdateImgContent(this.vm, {super.key});

//   @override
//   _ProfileImagePickerState createState() => _ProfileImagePickerState();
// }

// class _ProfileImagePickerState extends State<UpdateImgContent> {
//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 0.6,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircleAvatar(
//               backgroundImage: widget.vm.imageFile != null
//                   ? FileImage(widget.vm.imageFile!)
//                   : null,
//               radius: 75,
//               child: widget.vm.imageFile == null
//                   ? const Icon(Icons.person, size: 75)
//                   : null,
//             ),
//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () async {
//                     // await widget.vm.pickImageFromCamera();
//                     setState(
//                         () {}); // Actualiza el estado para reflejar la imagen seleccionada
//                   },
//                   iconSize: 35,
//                   color: COLOR_BLACK_LAEL,
//                   icon: const Icon(Icons.camera_alt_rounded),
//                 ),
//                 const SizedBox(width: 20),
//                 IconButton(
//                   onPressed: () {
//                     widget.vm.pickerImage();
//                     setState(
//                         () {}); // Actualiza el estado para reflejar la imagen seleccionada
//                   },
//                   color: COLOR_BLACK_LAEL,
//                   iconSize: 35,
//                   icon: const Icon(Icons.image),
//                 ),
//                 const SizedBox(width: 20),
//                 IconButton(
//                   onPressed: () {
//                     widget.vm.updateImg();
//                     Navigator.pop(
//                         context); // Cierra el modal después de guardar la imagen
//                   },
//                   color: COLOR_BLACK_LAEL,
//                   iconSize: 35,
//                   icon: const Icon(Icons.check_rounded),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
