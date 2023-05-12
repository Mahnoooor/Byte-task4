import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:name/screen5.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
   final _formKey = GlobalKey<FormState>();
   final TextEditingController name=TextEditingController();
  String imageurl='';

   CollectionReference _reference =
      FirebaseFirestore.instance.collection('Picture_list');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(148, 25, 51, 73),
      appBar:AppBar(
        elevation: 0,
        title: Center(child: Text('Upload picture from gallery')),
        backgroundColor: Colors.transparent
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:7.w,vertical: 5.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
          TextFormField(
                        controller: name,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  hintStyle:TextStyle(color:Colors.white),
                  fillColor: Color.fromRGBO(255, 255, 255, 0.1), 
                 filled: true,
                 suffixIcon: Icon(Icons.person,color:  Colors.white.withOpacity(0.8)),
             //TextStyle(fontSize: 20.0, color:Colors.white),
                 focusedBorder:  OutlineInputBorder(
            borderSide:
                  BorderSide(width: 2.sp, color: Colors.white), 
            borderRadius: BorderRadius.circular(15.sp),
                 ),
                  enabledBorder: OutlineInputBorder(
            borderSide:
                  BorderSide(width: 1.sp, color: Colors.grey), 
            borderRadius: BorderRadius.circular(15.sp),
                 )
                ),
                       
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
          
                      SizedBox(
                        height: 3.h,
                      ),
           
DottedBorder(
  color: Colors.white60,
  borderPadding: EdgeInsets.all(2.sp),
  strokeWidth: 2,
  
  child:   GestureDetector(
     onTap: () async {
                               ImagePicker imagePicker=ImagePicker();
                               XFile? file=await imagePicker.pickImage(source: ImageSource.gallery);
                               print('${file?.path}');
              String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
                               //
                               Reference referenceRoot=FirebaseStorage.instance.ref();
                               Reference referenceDirImages=referenceRoot.child('images');//this will create directory of images in storage of firebase
               
                               // now to upload the file creating ref of image to be stored
                               Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);
              try{
                                 //upload/store image
              await referenceImageToUpload.putFile(File(file!.path));
              imageurl=await referenceImageToUpload.getDownloadURL();
              }
              catch(e){print(e.toString());}
              
                              },
    child: Container(
    
      height: 20.h,
    
      width: 66.w,
    
      decoration: BoxDecoration(
    
        borderRadius: BorderRadius.circular(10),
  
    
      ),
    
      child: Column(
    
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
    
        children: [
    
          Padding(
            padding:  EdgeInsets.only(right: 12.5.w),
            child: IconButton( onPressed: (){}    , icon:  Icon(Icons.cloud_upload_outlined,color: Colors.white60,size: 40.sp,)),
          ),
    
         SizedBox(height: 6.h,), 
    ///text
         const Center(
    
              child: Text(
    
                'Select Your picture',
    
                style: TextStyle(
    
                  fontSize: 18,
    
                 
                  color: Colors.white70
    
                ),
    
              ),
    
            ),
    
          
         
  
        ],
    
      ),
    
    ),
  ),
),


                    
                    SizedBox(height: 2.h,),
          /////////upload container
          ///
                        Padding(
                          padding:  EdgeInsets.only(left:37.w),
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                            width: 28.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color:  Color.fromRGBO(255, 255, 255, 0.1), 
                            ),
                            child: TextButton(
                                 onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (imageurl.isEmpty) {
                                // Show an error message if the image has not been uploaded
                                Get.snackbar(
                                  'Upload failed',
                                  'Please select an image',
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else {
                                Map<String, dynamic> dataToSend = {
                                  'name': name.text,
                                  'image': imageurl,
                                };
                                                  
                                // Save the Map to the "post" document with document id "postId" in the "posts" collection
                                _reference.add(dataToSend);
                                                  
                                // Show a success message
                                Get.snackbar(
                                  'Upload successful',
                                  'Your post has been uploaded',
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                                                  
                                // Clear the form and image URL
                                _formKey.currentState!.reset();
                                name.clear();
                                setState(() {
                                  imageurl = '';
                                });
                                
                              }
                            }
                                                  },
                                                  
                                                  
                                      //           
                              child: Text(
                                "Upload",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                             
                              
                                                ),)
                                              ),
                          ),
                        ),

                   
              ],
            ),
          ),
        ),
         
      ),
      floatingActionButton:  FloatingActionButton(onPressed: (){
                      Get.to(PictureList());
                    },
                    backgroundColor: Color.fromRGBO(255, 255,255,0.15),
                    child: Icon(Icons.forward),),
    );
  }
}