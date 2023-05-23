import 'package:expensesmanager/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  RxString inex = "".obs;
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdes = TextEditingController();
  TextEditingController txtamo = TextEditingController();
  TextEditingController txtcat = TextEditingController();
  RxString amt="00".obs;
  DateTime date = DateTime.now();
  DateTime? d1;
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? t1;
  RxString dateint = "".obs;
  RxString mon = "".obs;
  RxString year = "".obs;
  RxInt? hou = 0.obs;
  RxInt? min = 0.obs;
  RxInt? i;
  RxString cat="".obs;
  RxString pymethod="Cash".obs;
  RxList<Map> catlist = <Map>[].obs;


  RxList cate=[
    'Food & Drinks',
    "Bill & Fees",
    "Transport",
    "Groceries",
    "Entertsinment",
    "Shopping",
    "Gifts",
    "Health",
    "Investments",
    "Lones",
    "Salary"
  ].obs;

  RxList tlist=[
    "Expense",
    "Income",
  ].obs;

  void instert()
  {
    Dbhelper dbhelper = Dbhelper();
    if(amt.value!="00"&&amt.value!="0")
      {
        dbhelper.insertData(d1: d1.toString(),t1: t1.toString(),des: txtdes.text,title: txttitle.text, category: cat.value, desc: txtdes.text, date: dateint.value, month: mon.value, year: year.value, hou: hou!.value, min: min!.value, amt: amt.value, pytype: pymethod.value,type: inex.value);
        txtdes.clear();
        txttitle.clear();
        txtamo.clear();
        dateint.value="0";
        mon.value="0";
        year.value="0";
        hou!.value=0;
        min!.value=0;
        amt.value="0";
        pymethod.value="Cash";
        cat.value="";
      }
  }

  void inscat()
  {
    Dbhelper dbhelper = Dbhelper();
   if(txtcat.text!="")
     {
       dbhelper.insertcat(title: txtcat.text);
       txtcat.clear();
     }
  }

  Future<void> redcat()
  async {
    Dbhelper dbhelper =Dbhelper();
    catlist.value = await dbhelper.readcat();
  }

  void insexcat()
  {
    Dbhelper dbhelper = Dbhelper();
   if(txtcat.text!="")
     {
       dbhelper.insertexcat(title: txtcat.text);
       txtcat.clear();
     }
  }

  Future<void> redexcat()
  async {
    Dbhelper dbhelper =Dbhelper();
    catlist.value = await dbhelper.readexcat() ;
  }
}
