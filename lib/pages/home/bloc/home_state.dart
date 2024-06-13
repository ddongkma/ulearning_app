
import 'package:ulearning_app/common/entities/course.dart';

import '../../../common/entities/shop.dart';

class HomeState {

  const HomeState({this.index=0,this.branchs = const <BranchDetailEntity>[]});
   final int index;
   final List<BranchDetailEntity> branchs ;
  HomeState copyWith({int? index, List<BranchDetailEntity>? branchs}){
    return  HomeState(
      branchs: branchs??this.branchs,
      index:index??this.index
    );
  }
}



