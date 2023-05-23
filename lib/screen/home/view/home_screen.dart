import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:expensesmanager/screen/update/controller/update_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  UpdateController updateController = Get.put(UpdateController());
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      homeController.income();
      homeController.readTransaction();
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff111113),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/fil");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          color: Color(0xff111113),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white70)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                            size: 14.sp,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "${formatDate(homeController.d1, ["MM"])}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Color(0xff111113),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white70)),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text(
                    "INR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Obx(
                    () =>  Text(
                      "${homeController.total.value}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      homeController.inex.value="Income";
                      Get.toNamed('/inex');
                    },
                    child: Container(
                      width: 46.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            Color(0xff17CEA0),
                            Color(0xff48F1C6),
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.download,
                                  size: 20.sp, color: Colors.white),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "Income",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () =>  Text(
                                  "${homeController.tin.value } ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ),
                              Text(
                                "INR ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/exs');
                    },
                    child: Container(
                      width: 46.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            Color(0xffF7F7F7),
                            Color(0xff97969C),
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.upload, size: 20.sp),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "Expense",
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => Text(
                                  "${homeController.tex.value} ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20.sp),
                                ),
                              ),
                              Text(
                                "INR ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 20.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                height: 0.2.h,
                width: double.infinity,
                color: Colors.white54,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text("Your income/expanse",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 2.5.h,
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        updateController.index.value = homeController.transactionList[index]['id'];
                        updateController.inex.value=homeController.transactionList[index]['type'];
                        updateController.pymethod.value=homeController.transactionList[index]['pytype'];
                        updateController.amt.value=homeController.transactionList[index]['amt'];
                        updateController.hou!.value=int.parse(homeController.transactionList[index]['hou']);
                        updateController.min!.value=int.parse(homeController.transactionList[index]['min']);
                        updateController.txtamo.text=homeController.transactionList[index]['amt'];
                        updateController.year.value=homeController.transactionList[index]['year'];
                        updateController.mon.value=(homeController.transactionList[index]['month']);
                        updateController.dateint.value=homeController.transactionList[index]['date'];
                        updateController.txttitle.text=homeController.transactionList[index]['title'];
                        updateController.txtdes.text=homeController.transactionList[index]['des'];
                        updateController.cat.value=homeController.transactionList[index]['category'];
                        updateController.d1 = DateTime.tryParse(homeController.transactionList[index]['d1']);
                        updateController.t1 = TimeOfDay(hour: int.parse(homeController.transactionList[index]['hou']),minute: int.parse(homeController.transactionList[index]['min']));
                        Get.toNamed('/update');
                      },
                      child: Container(
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
                              )),
                    ),
                    itemCount: homeController.transactionList.length)),
              ),
              SizedBox(height: 5.4.h,),
            ],
          ),
        ),
      ),
    );
  }
}