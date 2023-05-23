import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../add/controller/add_controller.dart';

class Inex_screen extends StatefulWidget {
  const Inex_screen({Key? key}) : super(key: key);

  @override
  State<Inex_screen> createState() => _Inex_screenState();
}

class _Inex_screenState extends State<Inex_screen> {
  HomeController homeController = Get.put(HomeController());
  AddController addController = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      homeController.income();
      homeController.readTransaction();
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff111113),
        body: Container(
          width: 100.w,
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Color(0xff111113),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white70)),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    ),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        addController.inex.value="Income";
                        Get.toNamed('/add');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            color: Color(0xff111113),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white70)),
                        child: Text(
                          "Income",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(alignment: Alignment(-1, 0),child: Text("Income",style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
                SizedBox(
                  height: 1.h,
                ),
                Align(alignment: Alignment(-1, 0),child: Text("${homeController.bankin.value+homeController.cashin.value}.00 INR",style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold),)),
                SizedBox(
                  height: 10.h,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Container(
                        width: 25.h,
                        height: 25.h,
                        child: Obx(
                          () => CircularProgressIndicator(
                            backgroundColor: Colors.white54,
                            color: Color(0xff17CEA0),
                            value: homeController.bankpr.value,
                            strokeWidth: 70.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.4.h,left: 32.w),
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Color(0xff111113),
                      ),
                      child: Icon(Icons.download,color: Colors.white70,size: 50.sp,)
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 2.h,width: 2.h,color: Color(0xff17CEA0),),
                    SizedBox(width: 2.w,),
                    Text("Bank income",style: TextStyle(color: Color(0xff17CEA0),fontSize: 15.sp),)
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 2.h,width: 2.h,color: Colors.white54,),
                    SizedBox(width: 2.w,),
                    Text("Cash income",style: TextStyle(color: Colors.white54,fontSize: 15.sp),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Obx(() => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => (homeController.transactionList[index]['type']=="Income"||homeController.transactionList[index]['category']=="Income")?Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                    child: homeController.transactionList[index]['pytype']=="Cash"?Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(CupertinoIcons.money_dollar_circle,size: 15.sp,color: Colors.white,),
                                        SizedBox(width: 5,),
                                        Text("Cash",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                      ],
                                    ):Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.comment_bank,color: Colors.white,size: 15.sp,),
                                        SizedBox(width: 5,),
                                        Text("Bank",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                      ],
                                    ),
                                  ),
                                  homeController.transactionList[index]['type']=="Transfer"?Container():homeController.transactionList[index]['category']==""?Container():Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.only(left: 2.w),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("${homeController.transactionList[index]['category']}",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                      ],
                                    ),
                                  ),
                                  homeController.transactionList[index]['type']=="Transfer"?Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.only(left: 2.w),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black,),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Transfer",style: TextStyle(color: Colors.white,fontSize: 15.sp),)
                                      ],
                                    ),
                                  ):Container(),
                                ],
                              ),
                              homeController.transactionList[index]['title']==""?Container():Container(margin: EdgeInsets.symmetric(vertical: 1.h),child: Text("${homeController.transactionList[index]['title']}",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w600),)),
                              SizedBox(height: 1.h,),
                              homeController.transactionList[index]['type']=="Transfer"? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xff6A4DDF),
                                          Color(0xff6A4DFF),
                                        ])),
                                    child:  homeController.transactionList[index]['category']=="Income"?Icon(Icons.download,color: Colors.white,size: 20.sp):Icon(Icons.upload,color: Colors.white,size: 20.sp),
                                  ),
                                  SizedBox(width: 3.w,),
                                  Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff6A4DDF),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                ],
                              ): homeController.transactionList[index]['type']=="Income"?Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xff17CEA0),
                                          Color(0xff48F1C6),
                                        ])),
                                    child: Icon(Icons.download,color: Colors.white,size: 20.sp),
                                  ),
                                  SizedBox(width: 3.w,),
                                  Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff17CEA0),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                ],
                              ):Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xffF7F7F7),
                                          Color(0xff97969C),
                                        ])),
                                    child: Icon(Icons.upload,color: Colors.black,size: 20.sp),
                                  ),
                                  SizedBox(width: 3.w,),
                                  Text("${homeController.transactionList[index]['amt']}",style: TextStyle(color: Color(0xff97969C),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ],
                          )):Container(),
                      itemCount: homeController.transactionList.length)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
