// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/domain/models/desafios.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/desafios/list/desafios_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/desafios/list/widgets/desafios_page_content.dart';

// class DesafiosResponse extends StatelessWidget {
//   final DesafiosViewModel vm;
//   const DesafiosResponse(this.vm, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: vm.getDesafios(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (!snapshot.hasData) {
//           return const Center(
//             child: Text('No hay desafios'),
//           );
//         }
//         final response = snapshot.data;
//         if (response is Error) {
//           final data = response as Error;
//           return Center(
//             child: Text('Error: ${data.error}'),
//           );
//         }
//         final desafiosList = response as Success<List<Desafios>>;
//         return GridView.builder(
//             itemCount: desafiosList.data.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 2.5,
//                 // crossAxisSpacing: 1.5,
//                 mainAxisExtent: 210),
//             itemBuilder: (context, index) {
//               final desafio = desafiosList.data[index];
//               return DesafiosPageContent(vm, desafio);
//             });
//       }),
//     );
//   // 
// }
