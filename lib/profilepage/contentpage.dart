import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieproject/profilepage/componentpage/clickablepage.dart';

class Contentpage extends StatefulWidget {
  @override
  _ContentpageState createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  bool loading = false;
  var res;
  int apilength = 0;

  @override
  void initState() {
    super.initState();
    apihit();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Center(
          child: Text('MOVIES'),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: loading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ClickPage(res[index]['image'])));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Hero(
                                    tag: res[index]['image'],
                                    child: Image.network(res[index]['image']),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${res[index]['title'].toString()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Rating :-${res[index]['rating'].toString()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('${getData(res[index]['genre'])}'),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                          '${res[index]['releaseYear'].toString()}'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.black12,
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: apilength,
                )),
    );
  }
  Future<void> apihit() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url);
    res = jsonDecode(response.body);
    print(res[1]);
    setState(() {
      apilength = res.length;
      loading = false;
    });
  }
  getData(List<dynamic> data) {
    String cc = '';
    for (int i = 0; i < data.length; i++) {
      cc += data[i] + ', ';
    }
    return cc;
  }
}
