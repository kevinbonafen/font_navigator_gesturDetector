import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_finance_app/user%20interface/category_page.dart';
import 'package:project_finance_app/user%20interface/home_page.dart';
import 'package:project_finance_app/user%20interface/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  void onTapTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //1. membuat calendar app bar (semua widget calendar di handle library)
      //pakai pengkodidsian jika currentIndex 0 maka akan muncul app bar di home page saja
      appBar: (currentIndex == 0) ? CalendarAppBar(
        accent: Colors.deepPurple,
        backButton: false,
        locale: 'eng',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ) : 
      PreferredSize(
        child: Container(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          child: Text('Categories', 
          style: GoogleFonts.montserrat(fontSize: 20)),
        ),
      ), 
        preferredSize: Size.fromHeight(100)),
      
      
      //2. membuat tombol floating action + 
      floatingActionButton: Visibility(
        //pengkodisian jika currentindex == 0 maka floating action hanya muncul di home page saja (ternary operation)
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => TransactionPage())
            )
          );
        },
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
        ),
      ),
        
        //memmbuat tombol + menjadi di tengah
         //fungsi membuat tombol list bisa dialihkan ke page selanjutnya
         body: _children[currentIndex],
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       
      
      //3. membuat tombol navigasi bar bawah
       bottomNavigationBar: BottomAppBar(
       child: Row(
         //jarak antar button
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         IconButton(
          onPressed: (){
           onTapTapped(0);
         }, 
         icon: Icon(Icons.home)),
         //jarak antar button
      SizedBox(width: 20,),
         IconButton(onPressed: (){
          onTapTapped(1);
         }, icon: Icon(Icons.list))

      
     ]),)
    );
  }
}