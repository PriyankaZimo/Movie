import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieproject/DataModel/first_model_page.dart';
import 'package:movieproject/provider/provider_page.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postMdl = Provider.of<ProviderPage>(context, listen: false);
    postMdl.apihit();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Movie Provider List',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Consumer<ProviderPage>(
          builder: (context, val, child) => val.listPage.length==0
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      showDetail(val.listPage[index], context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            val.listPage[index].image.toString(),
                            height: 120,
                            width: 100,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  val.listPage[index].title.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val.listPage[index].rating.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val.listPage[index].genre.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                val.listPage[index].releaseYear.toString(),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                  ),
                  itemCount: val.listPage.length,
                ),
        ));
  }

  void showDetail(ModelPage listPage, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Container(
                child: Text(listPage.title.toString()),
              ),
            ));
  }
}
