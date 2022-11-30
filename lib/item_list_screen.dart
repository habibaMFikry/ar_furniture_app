import 'item_model.dart';
import 'ar_view_screen.dart';
import 'package:flutter/material.dart';

class itemListScreen extends StatelessWidget {
  List<itemModel> items = [
    itemModel('chair', 'sofa', 'items/46.png', 6),
    itemModel('chair', 'sofa', 'items/40.png', 6),
    itemModel('chair', 'sofa', 'items/42.png', 6),
    itemModel('chair', 'sofa', 'items/1.png', 6),
    itemModel('chair', 'sofa', 'items/2.png', 6),
    itemModel('chair', 'sofa', 'items/3.png', 6),
    itemModel('chair', 'sofa', 'items/5.png', 6),
    itemModel('chair', 'sofa', 'items/7.png', 6),
    itemModel('chair', 'sofa', 'items/9.png', 6),
    itemModel('chair', 'sofa', 'items/10.png', 6),
    itemModel('chair', 'sofa', 'items/11.png', 6),
    itemModel('chair', 'sofa', 'items/12.png', 6),
    itemModel('chair', 'sofa', 'items/13.png', 6),
    itemModel('chair', 'sofa', 'items/16.png', 6),
    itemModel('chair', 'sofa', 'items/17.png', 6),
    itemModel('chair', 'sofa', 'items/19.png', 6),
    itemModel('chair', 'sofa', 'items/22.png', 6),
    itemModel('chair', 'sofa', 'items/24.png', 6),
    itemModel('chair', 'sofa', 'items/25.png', 6),
    itemModel('chair', 'sofa', 'items/26.png', 6),
    itemModel('chair', 'sofa', 'items/27.png', 6),
    itemModel('chair', 'sofa', 'items/28.png', 6),
    itemModel('chair', 'sofa', 'items/29.png', 6),
    itemModel('chair', 'sofa', 'items/30.png', 6),
    itemModel('chair', 'sofa', 'items/32.png', 6),
    itemModel('chair', 'sofa', 'items/34.png', 6),
    itemModel('chair', 'sofa', 'items/36.png', 6),
    itemModel('chair', 'sofa', 'items/37.png', 6),
    itemModel('chair', 'sofa', 'items/38.png', 6),
    itemModel('chair', 'sofa', 'items/48.png', 6),
    itemModel('chair', 'sofa', 'items/49.png', 6),
    itemModel('chair', 'sofa', 'items/43.png', 6),
    itemModel('chair', 'sofa', 'items/44.png', 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'AR',
                  style: TextStyle(fontSize: 48, color: Colors.red),
                ),
                Text(
                  'Furniture',
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.red,
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  'App',
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.red,
                      fontWeight: FontWeight.w100),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArViewScreen(itemImg: items[index].pic),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              '${items[index].pic}',
                              width: 60,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  items[index].detail,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            child: Text(
                              items[index].price.toString(),
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: items.length),
            ),
          ),
        ],
      )),
    );
  }
}
