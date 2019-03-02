import 'package:flutter/material.dart';
import 'package:nasa/model/image.dart';

MaterialPageRoute view(String text, List list, Map map) {
  bool check(String text) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == text) return true;
    }
    return false;
  }

  return MaterialPageRoute(
    builder: (context) => Scaffold(
          appBar: AppBar(title: Text("Meaning")),
          body: check(text)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        text,
                        style: TextStyle(fontSize: 50.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 500.0,
                        width: 500.0,
                        child: ListView.builder(
                          itemCount: map[text].split(" ").length,
                          itemBuilder: (context, int i) => Center(
                                child: InkWell(
                                    child: map[text].split(" ")[i] != "or"
                                        ? Text(
                                            map[text].split(" ")[i],
                                            style: TextStyle(fontSize: 30.0),
                                          )
                                        : Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Text(
                                                "OR",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                            ],
                                          ),
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ViewPhoto(
                                                text:
                                                    map[text].split(" ")[i])))),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Click on text to get Image")
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    "Not Found\nTry another Word",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
        ),
  );
}
