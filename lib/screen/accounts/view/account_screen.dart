import 'dart:async';

import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  HomeController homeController = Get.put(HomeController());

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
              Text(
                "Accounts",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Obx(
                () =>  Text("Total : INR ${homeController.total}",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/accm');
                },
                child: Container(
                  height: 30.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white54)),
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                            gradient: LinearGradient(colors: [
                              Color(0xff17CEA0),
                              Color(0xff48F1C6),
                            ])),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.money_dollar_circle,color: Colors.white,size: 20.sp,),
                                SizedBox(width: 10,),
                                Text("Cash",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22.sp),),
                                SizedBox(width: 200,),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Obx(() => Text("${homeController.cashin.value-homeController.cashex.value} INR",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text("Cash Income\n ${homeController.cashin}",style: TextStyle(color: Colors.white70,fontSize: 15.sp),textAlign: TextAlign.center)),
                              Container(
                                width: 1.w,
                                height: 6.h,
                                color: Colors.white70,
                              ),
                              Obx(() =>  Text("Cash Expense\n ${homeController.cashex}",style: TextStyle(color: Colors.white70,fontSize: 15.sp),textAlign: TextAlign.center)),
                            ],
                          ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/accb');
                },
                child: Container(
                  height: 30.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white54)),
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                            gradient: LinearGradient(colors: [
                              Color(0xff6A4DDF),
                              Color(0xff6A4DFF),
                            ])),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.comment_bank,color: Colors.white,size: 20.sp,),
                                SizedBox(width: 10,),
                                Text("Bank",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22.sp),),
                                SizedBox(width: 200,),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Obx(() => Text("${homeController.bankin.value-homeController.bankex.value} INR",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() => Text("Bank Income\n ${homeController.bankin}",style: TextStyle(color: Colors.white70,fontSize: 15.sp),textAlign: TextAlign.center)),
                            Container(
                              width: 1.w,
                              height: 6.h,
                              color: Colors.white70,
                            ),
                            Obx(() => Text("Bank Expense\n ${homeController.bankex}",style: TextStyle(color: Colors.white70,fontSize: 15.sp),textAlign: TextAlign.center)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
