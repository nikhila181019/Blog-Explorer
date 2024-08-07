import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:blog_explorer/bloc/blog_event.dart';
import 'package:blog_explorer/bloc/blog_state.dart';
import 'package:blog_explorer/widgets/blog_item.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Blogs and Articles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Implement menu functionality
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is BlogLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is BlogLoaded) {
                  return ListView.builder(
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return BlogItem(blog: blog);
                    },
                  );
                } else if (state is BlogError) {
                  return Center(child: Text(state.message, style: TextStyle(color: Colors.white)));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
