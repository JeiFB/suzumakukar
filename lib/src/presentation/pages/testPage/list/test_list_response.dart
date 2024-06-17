// import 'package:flutter/material.dart';
// import 'package:suzumakukar/src/domain/models/test.dart';
// import 'package:suzumakukar/src/domain/utils/resource.dart';
// import 'package:suzumakukar/src/presentation/pages/testPage/list/test_list_viewmodel.dart';
// import 'package:suzumakukar/src/presentation/pages/testPage/widgets/test_list_content.dart';

// class TestListResponse extends StatelessWidget {
//   final TestListViewModel vm;
//   const TestListResponse(this.vm, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: vm.getTest(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (!snapshot.hasData) {
//           return const Center(
//             child: Text('No hay Test'),
//           );
//         }
//         final response = snapshot.data;
//         if (response is Error) {
//           final data = response as Error;
//           return Center(
//             child: Text('Error: ${data.error}'),
//           );
//         }
//         final testList = response as Success<List<Test>>;
//         return ListView.builder(
//           itemCount: testList.data.length,
//           itemBuilder: (context, index) {
//             final test = testList.data[index];
//             return TestListContent(vm, test);
//           },
//         );
//       }),
//     );
//   }
// }
