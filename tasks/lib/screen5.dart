import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:name/screen4.dart';

class PictureList extends StatefulWidget {
  @override
  _PictureListState createState() => _PictureListState();
}

class _PictureListState extends State<PictureList> {
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Picture_list');

  late Stream<QuerySnapshot> _stream;
  List<Map> items = [];


  @override
  void initState() {
    super.initState();
    _stream = _reference.snapshots();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(148, 25, 51, 73),
      appBar: AppBar(
        title: Text('Pictures',style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Check error
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            //Check if data arrived
            if (snapshot.hasData) {
              //get the data
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              //Convert the documents to Maps
              items = documents.map((e) => e.data() as Map).toList();

              // Check for deleted images
// Check for deleted images
// Check for deleted images
for (var i = 0; i < items.length; i++) {
  var item = items[i];
  if (item.containsKey('image')) {
    String imageUrl = item['image'];
    FirebaseStorage.instance.refFromURL(imageUrl).getDownloadURL().then((value) {
      // Image is still valid
    }).catchError((error) {
      // Image is not valid, remove it from the list
      items.removeAt(i);
      setState(() {});
    });
  }
}

// Remove the deleted documents from Firestore




            

              //Display the list as a column
              return SingleChildScrollView(
                child: Column(
                  children: items.map((item) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
                      child: Column(
                        children: [
                          Container(
    decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 0.5.w,
    ),
  ),
                            width: 90.w,
      height: 30.h,
      child: item.containsKey('image')
        ? Expanded(
            child: Image.network(
              '${item['image']}',
              height: 30.h,
              fit: BoxFit.cover,
            ),
          )
        : Container(),
    ),
                          SizedBox(height: 2.h),
RichText(
  text: TextSpan(
    style: TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    children: [
     const TextSpan(
        text: 'Owner: ',
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      TextSpan(
        text: '${item['name']}',
        style:const TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),


                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            }

            //Show loader
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
     
    );
  }
}
