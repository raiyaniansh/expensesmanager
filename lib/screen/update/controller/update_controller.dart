import 'package:expensesmanager/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController
{
  RxString inex = "".obs;
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdes = TextEditingController();
  TextEditingController txtamo = TextEditingController();
  TextEditingController txtcat = TextEditingController();
  RxString amt="00".obs;
  RxString dateint = "".obs;
  RxString mon = "".obs;
  RxString year = "".obs;
  RxInt? hou = 0.obs;
  RxInt? min = 0.obs;
  RxString cat="".obs;
  RxString pymethod="".obs;
  DateTime? d1;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? t1;
  RxInt index = 0.obs;
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

  void Delete()
  {
    Dbhelper dbhelper = Dbhelper();
    dbhelper.Deletedata(id: index.value);
  }

  void Update()
  {
    Dbhelper dbhelper = Dbhelper();
    dbhelper.Updatedata(id: index.value, d1: d1.toString(),t1: t1.toString(),des: txtdes.text,title: txttitle.text, category: cat.value, desc: txtdes.text, date: dateint.value, month: mon.value, year: year.value, hou: hou!.value, min: min!.value, amt: amt.value, pytype: pymethod.value,type: inex.value);
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