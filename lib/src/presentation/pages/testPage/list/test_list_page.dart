import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzumakukar/src/colors/base_color.dart';
import 'package:suzumakukar/src/domain/models/test.dart';
import 'package:suzumakukar/src/domain/utils/resource.dart';
import 'package:suzumakukar/src/presentation/components/suzumakukar_appbar.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/create/create_test_page.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/list/test_list_viewmodel.dart';
import 'package:suzumakukar/src/presentation/pages/testPage/widgets/test_list_content.dart';

class TestListPage extends StatelessWidget {
  const TestListPage({super.key});

  @override
  Widget build(BuildContext context) {
    TestListViewModel vm = Provider.of<TestListViewModel>(context);
    Color textColor = COLOR_WHITE;
    Color colorAppBar = COLOR_PURPLE;
    return Scaffold(
      appBar: SuzumakukarAppBar(null, 'TESTS', textColor, null, colorAppBar),
      body: StreamBuilder(
        stream: vm.getTest(),
        builder: ((context, snapshot) {
          final response = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No hay informacion',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }
          final testList = response as Success<List<Test>>;
          return GridView.builder(
              itemCount: testList.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.9,
                  // crossAxisSpacing: 1.5,
                  mainAxisExtent: 210),
              itemBuilder: (context, index) {
                final test = testList.data[index];
                return testList.data.isNotEmpty
                    ? TestListContent(vm, test)
                    : const Center(
                        child: Text('No elementos '),
                      );
              });
        }),
      ),
      floatingActionButton: const CreateTestPage(),
    );
  }
}
