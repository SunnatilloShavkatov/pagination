import 'package:flutter/material.dart';

class InfiniteScrollingPagination extends StatelessWidget {
  final bool isLoading;
  final Function onPagination;
  final Widget child;

  InfiniteScrollingPagination({
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
            child: SizedBox(
              height: 36,
              width: 36,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
