import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/pages/search/bloc/search_bloc.dart';
import 'package:ulearning_app/pages/search/bloc/search_state.dart';
import 'package:ulearning_app/pages/search/search_controller.dart';
import 'package:ulearning_app/pages/search/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late UserItem userItem;
  late SearchControllerPage _searchControllerPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _searchControllerPage = SearchControllerPage(context);
     _searchControllerPage.init();
    // SearchControllerPage(context).init();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        // SearchControllerPage(context).init();
        return KeyboardDismisser(
          child: Scaffold(
              appBar: buildAppBar(),
              body: Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: Column(children: [
                    searchView(context,state ),
                    SizedBox(height: 15.h),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.searchItem.length,
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return courseSearchList(state.searchItem[index].name.toString(),state.searchItem[index].thumbnail.toString(),);
                          }),
                    )
                  ]))),
        );
      },
    );
  }
}
