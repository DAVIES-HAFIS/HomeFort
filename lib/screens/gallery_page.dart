import 'package:flutter/material.dart';
import 'package:homefort_app/screens/splash_screen.dart';
import 'package:homefort_app/utility/photo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

import 'package:shared_preferences/shared_preferences.dart';


class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<DataModel> model;

  @override
  void initState() {
    getUserData();
    getData();
    super.initState();
  }

  getUserData() async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var obtainEmail = _prefs.getString('email');
    setState(() {
      finalEmail = obtainEmail;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text('Welcome $finalEmail'),
      ),
      body: model == null? Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin:EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        model[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(formattedTime),
                        Text(
                          model[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                         model[index].id.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<void> getData() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', '/photos');
    http.Response res = await http.get(url);
    print(res.body);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item)=> DataModel.fromJson(item)).toList();
    setState(() {

    });
  }
}