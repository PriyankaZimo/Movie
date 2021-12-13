import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  var res;
  var apilength = 0;

  @override
  initState() {
    apihit();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Movies'),
        actions: [Icon(Icons.menu)],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.network(res[index]['image'])),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${res[index]['title'].toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('${res[index]['rating'].toString()}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${getdata(res[index]['genre'])}'),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text('${res[index]['releaseYear'].toString()}'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            )
          ]),
        ),
        itemCount: apilength,
      ),
    );
  }

  Future<void> apihit() async {
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await (http.get(url));
    res = jsonDecode(response.body);
    print(res[1]);
    setState(() {
      apilength = res.length;
    });
  }

  getdata(List<dynamic> data) {
    String cc = ' ';
    for (int i = 0; i < data.length; i++) {
      cc += data[i] + ',';
    }
    return cc;
  }
}
