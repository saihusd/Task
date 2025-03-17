part of 'infinite_list_bloc.dart';

@immutable
sealed class InfiniteListEvent {}

final class InfiniteListIntialEvent extends InfiniteListEvent {}

final class InfiniteListLoadMoreApiEvent extends InfiniteListEvent {}
