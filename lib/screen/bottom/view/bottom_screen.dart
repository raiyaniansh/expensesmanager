import 'package:expensesmanager/screen/accounts/view/account_screen.dart';
import 'package:expensesmanager/screen/add/controller/add_controller.dart';
import 'package:expensesmanager/screen/bottom/controller/bottom_controller.dart';
import 'package:expensesmanager/screen/home/controller/home_controller.dart';
import 'package:expensesmanager/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {

  BottomController controller = Get.put(BottomController());
  AddController addController = Get.put(AddController());

  List screen = [HomeScreen(),AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff111113),
          body: Stack(
            children: [
              Obx(
                () =>  Container(
                  child: screen[controller.i.value],
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: Container(
                  height: 8.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Obx(
                        () =>  InkWell(
                          onTap: () {
                            controller.ChangeIndex(0);
                          },
                          child: Container(
                            width: 50.w,
                            height: 8.h,
                            alignment: Alignment.center,
                            child: (controller.i.value==0)?Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.home_outlined,color:  Color(0xff6A4DFF), ),
                                SizedBox(width: 1.w,),
                                Text("Home",style: TextStyle(fontSize: 15.sp,color: Color(0xff6A4DFF),),),
                                SizedBox(width: 10.w,),
                              ],
                            ):Icon(Icons.home_outlined,color:  Colors.white, ),
                          ),
                        ),
                      ),
                      Obx(
                        () =>  InkWell(
                          onTap: () {
                            controller.ChangeIndex(1);
                          },
                          child: Container(
                            width: 50.w,
                            height: 8.h,
                            alignment: Alignment.center,
                            child: (controller.i.value==1)?Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 10.w,),
                                Icon(Icons.wallet_rounded,color:  Color(0xff6A4DFF), ),
                                SizedBox(width: 1.w,),
                                Text("Accounts",style: TextStyle(fontSize: 15.sp,color: Color(0xff6A4DFF),),),
                              ],
                            ):Icon(Icons.wallet_rounded,color:  Colors.white, ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.95),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (context) => Container(
                      color: Colors.transparent,
                      height: 50.h,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0.7, 0.3),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    addController.inex.value="Transfer";
                                    Get.back();
                                    Get.toNamed('/add');
                                  },
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient:  LinearGradient(colors: [
                                            Color(0xff6A4DFF),
                                          Color(0xff947FFE),
                                          Color(0xff947FFE),
                                        ]),
                                    ),
                                    child: Icon(
                                      Icons.person,color: Colors.white,size: 25.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Transfer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.7, 0.3),
                            child:  Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    addController.inex.value="Income";
                                    Get.back();
                                    Get.toNamed('/add');
                                  },
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xff17CEA0),
                                          Color(0xff48F1C6),
                                        ])
                                    ),
                                    child: Icon(
                                      Icons.download,color: Colors.white,size: 25.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Add Income",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, -0.2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    addController.inex.value="Expense";
                                    Get.toNamed('/add');
                                  },
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xffF7F7F7),
                                          Color(0xff97969C),
                                        ])
                                    ),
                                    child: Icon(
                                      Icons.upload,color: Colors.white,size: 25.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Add Expense",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment(0, 0.9),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 8.h,
                                width: 8.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xffF7F7F7),
                                      Color(0xff97969C),
                                    ])
                                ),
                                child: Icon(
                                  Icons.close,size: 25.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),);
                  },
                  child: Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff6A4DFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff6A4DFF).withOpacity(0.10),
                              spreadRadius: 5,blurRadius: 5
                          ),
                        ],
                    ),
                    child: Icon(
                      Icons.add,color: Colors.white,size: 25.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }
}
