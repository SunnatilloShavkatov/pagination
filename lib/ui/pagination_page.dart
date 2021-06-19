import 'package:flutter/material.dart';

class PaginationPage extends StatefulWidget {
  @override
  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  List items;
  List<String> data = ['', '', '', '', '', '', '', '', '', '', ''];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagination")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  getJSONData();
                }
                return;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("data"),
                    subtitle: Text("likes: $index"),
                  );
                },
              ),
            ),
          ),
          Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.white70,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getJSONData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      data.addAll(['', '', '', '', '']);
      isLoading = false;
    });
    // try {
    //   var url = "https://unsplash.com/napi/photos/" + lastItemId + "/related";
    //
    //   // Await the http get response, then decode the json-formatted responce.
    //   var response = await http.get(Uri.parse(url));
    //   if (response.statusCode == 200) {
    //     var jsonResponse = convert.jsonDecode(response.body);
    //     setState(() {
    //       List newItems = jsonResponse['results'];
    //       if (data == null) {
    //         data = newItems;
    //       } else {
    //         data.addAll(newItems);
    //       }
    //       lastItemId = data.last['id'];
    //       isLoading = false;
    //     });
    //     print(data.toString());
    //     print(lastItemId);
    //     return "sucessful";
    //   } else {
    //     print("Request failed with status: ${response.statusCode}.");
    //   }
    // } on Exception catch (error) {
    //   debugPrint(error.toString());
    // }
  }
}
