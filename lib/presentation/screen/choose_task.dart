import 'package:flutter/material.dart';

import 'infinite_list.dart';
import 'notes.dart';

class ChooseTask extends StatelessWidget {
  const ChooseTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>InfiniteList()));
                                  },
                child: const Text("Infinite scrolling Task")),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Notes()));
                },
                child: const Text("Local Storage Task"))
          ],
        ),
      ),
    );
  }
}
