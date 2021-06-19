import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final bool isLoading;
  final Function onPagination;
  final Widget child;

  const PaginationWidget({
    Key key,
    this.isLoading,
    this.onPagination,
    this.child,
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
            child: child,
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Container(
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
