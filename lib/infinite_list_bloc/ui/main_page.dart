import 'package:aplikasi_hello_world/infinite_list_bloc/bloc/post_bloc.dart';
import 'package:aplikasi_hello_world/infinite_list_bloc/ui/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List with BLoC'),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is PostUnitialized) {
            return Center(
                child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ));
          } else {
            PostLoaded postLoaded = state as PostLoaded;
            return ListView.builder(
                itemCount: postLoaded.posts.length,
                itemBuilder: (context, index) {
                  // return Text(postLoaded.posts[index].title);
                  return PostItem(postLoaded.posts[index]);
                });
          }
        }),
      ),
    );
  }
}
