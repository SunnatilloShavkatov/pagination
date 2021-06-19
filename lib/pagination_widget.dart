import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final bool isLoading;
  final Function onPagination;
  final Widget child;
  final List<String> data;

  const PaginationWidget({
    Key key,
    this.isLoading,
    this.onPagination,
    this.child,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  scrollInfo is ScrollUpdateNotification) {
                onPagination();
              }
              return;
            },
            child: Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("data"),
                      ),
                      subtitle: Text("likes: ${index + 1}"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
