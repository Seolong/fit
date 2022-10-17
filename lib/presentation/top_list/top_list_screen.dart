import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/top_list/components/add_top_dialog.dart';
import 'package:fit/presentation/top_list/components/top_item.dart';
import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../domain/model/cloth/top.dart';

class TopListScreen extends StatelessWidget {
  const TopListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TopListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<TopListViewModel>();
        viewModel.loadTops(categoryId);
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: SizedBox(
              width: 72,
              height: 72,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AddTopDialog(
                      topListViewModel: viewModel,
                      categoryId: categoryId,
                    ),
                  );
                },
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              title: FutureBuilder<String>(
                  future: context
                      .read<TopListViewModel>()
                      .getCategoryTitle(categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    } else {
                      return const Text('');
                    }
                  }),
            ),
            body: Consumer<TopListViewModel>(
              builder: (context, provider, _) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemCount: provider.tops.length + 2,
                itemBuilder: (context, index) {
                  if (index != 0 && index != provider.tops.length + 1) {
                    int topListIndex = index - 1;
                    Top top = provider.tops[topListIndex];
                    return TopItem(top, topListIndex);
                  } else if (index == 0) {
                    return Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: const Border(bottom: BorderSide(width: 0.5))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Expanded(
                              flex: 3,
                              child: Text(
                                '이름',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _tableFontSize),
                              )),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(_tablePadding),
                              child: Text(
                                '총장',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _tableFontSize),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text(
                              '어깨너비',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: _tableFontSize),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text(
                              '가슴단면',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: _tableFontSize),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text(
                              '소매길이',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: _tableFontSize),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 100,
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }

// AlertDialog _getAddTopDialog(BuildContext context){
// }
}
