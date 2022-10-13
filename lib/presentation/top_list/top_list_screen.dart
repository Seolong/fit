import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/top_list/components/add_top_dialog.dart';
import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TopListScreen extends StatelessWidget {
  const TopListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TopListViewModel>(),
      builder: (context, __) => SafeArea(
        child: Scaffold(
          floatingActionButton: SizedBox(
            width: 72,
            height: 72,
            child: FloatingActionButton(
              onPressed: () {
                // TODO: top 요소 추가 다이얼로그? 페이지?
                showDialog(context: context, builder: (_)=>AddTopDialog());
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
              // TODO: 색이 교차로 다르게(ex: 홀수번째 줄 하얀색, 짝수는 회색)
              padding: EdgeInsets.symmetric(horizontal: 6),
              itemCount: provider.tops.length + 2,
              itemBuilder: (context, index) {
                if (index != 0 && index != provider.tops.length+1) {
                  return SizedBox();
                } else if(index == 0){
                  return Container(
                    height: 60,
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
                  return const SizedBox(height: 100,);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // AlertDialog _getAddTopDialog(BuildContext context){
  // }
}
