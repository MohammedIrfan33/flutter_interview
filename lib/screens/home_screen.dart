import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_interview/model/popular.dart';
import 'package:flutter_interview/screens/login_screen.dart';
import 'package:flutter_interview/service/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpService fetch = HttpService();

  @override
  void initState() {
    super.initState();

    fetch.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF19731C),
        title: const Text('Popular'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

          }, child: Text(
            'log out',
            style: TextStyle(
              color: Colors.white
            ),
          )
          )
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Popular>>(
              future: fetch.fetchPost(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Popular>> snapshot) {
                if (snapshot.hasData) {
                  List<Popular>? popularList = snapshot.data;
                  return ListView(
                    children: popularList!
                        .map((Popular post) => Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    backgroundImage: NetworkImage(post.thumbImage??''),
                                    radius: 50,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          post.title ?? 'hai',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                post.byLine ?? 'authores',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            const Icon(Icons.calendar_month,color: Colors.grey,),
                                            Text(
                                                post.publishedDate ??
                                                    'published date',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
