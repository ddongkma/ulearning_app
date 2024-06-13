
import '../../../common/entities/shop.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeDotsEvent extends HomeEvent{
  final int index;
  const HomeDotsEvent(this.index):super();
}

class HomePageGetBranchEvent extends HomeEvent{
  final List<BranchDetailEntity> branchs;
  const HomePageGetBranchEvent(this.branchs);
}
