part of 'infinite_list_bloc.dart';

@immutable
sealed class InfiniteListState {}

final class InfiniteListLoadingState extends InfiniteListState {}

final class InfiniteListLoadedState extends InfiniteListState {
  List infiniteListModel;
  bool isLoading;
  InfiniteListLoadedState({required this.infiniteListModel,required this.isLoading});
}

final class InfiniteListSetState extends InfiniteListState {}
