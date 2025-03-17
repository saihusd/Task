import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saihutask1/core/constants.dart';
import 'package:saihutask1/data/model/infinite_list_model.dart';
import 'package:saihutask1/data/repository/api_endpoints.dart';
import 'package:saihutask1/data/repository/network_service.dart';

part 'infinite_list_event.dart';
part 'infinite_list_state.dart';

class InfiniteListBloc extends Bloc<InfiniteListEvent, InfiniteListState> {

  List infiniteListModel = [];
  bool isLoading = false;

  InfiniteListBloc() : super(InfiniteListLoadingState()) {

    on<InfiniteListIntialEvent>((event, emit) async {
      emit(InfiniteListLoadingState());
      isLoading = false;
      infiniteListModel = await NetworkService().fetchApiFunction(url: ApiEndpoints().url);
      emit(InfiniteListLoadedState(infiniteListModel: infiniteListModel,isLoading: isLoading));
    });

    on<InfiniteListLoadMoreApiEvent>((event, emit) async {
      print("dpfofjfjf");
      limit = limit+5;
      print("limit : $limit");
      isLoading = true;
      emit(InfiniteListSetState());
      print("dddd");
      emit(InfiniteListLoadedState(infiniteListModel: infiniteListModel,isLoading: isLoading));
      infiniteListModel = await NetworkService().fetchApiFunction(url: ApiEndpoints().url);
      print("infinite list length = ${infiniteListModel.length}");
      isLoading = false;
      emit(InfiniteListLoadedState(infiniteListModel: infiniteListModel,isLoading: isLoading));
    });

  }

}
