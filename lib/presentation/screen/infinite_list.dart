import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:saihutask1/presentation/bloc/infinite_list_bloc.dart';

class InfiniteList extends StatelessWidget {
  InfiniteList({super.key});

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite lists"),
      ),
      body: BlocBuilder<InfiniteListBloc, InfiniteListState>(
        bloc: InfiniteListBloc()..add(InfiniteListIntialEvent()),
        builder: (context, state) {
          if(state is InfiniteListLoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.black));
          }else if(state is InfiniteListLoadedState){
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.infiniteListModel.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          title: Text(state.infiniteListModel[index]['title'],style: const TextStyle(fontSize: 20,color: Colors.black)),
                          subtitle: Text(state.infiniteListModel[index]['body'],style: const TextStyle(fontSize: 16,color: Colors.black)),
                        );
                      }),
                  const SizedBox(height: 15,),
                  state.isLoading ? const CircularProgressIndicator() : const SizedBox(),
                  const SizedBox(height: 15,),
                  ElevatedButton(onPressed: (){
                    context.read<InfiniteListBloc>().add(InfiniteListLoadMoreApiEvent());
                  }, child: const Text("Load More"))
                ],
              ),
            );
          }else{
            return const SizedBox();
          }
          
        },
      ),
    );
  }
}
