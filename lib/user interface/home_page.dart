import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      //1. membuat container income dan expense dengan dibungkus padding
      child: SafeArea(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                   children: [
                     Container(
                      child: Icon(Icons.download, color: Colors.green),
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(7)),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Income', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12)), 
                        SizedBox(height: 4,),
                        Text('Rp 190.000.000', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14))
                      ],
                    )
                  ],
                ),
                Row(
                   children: [
                     Container(
                      child: Icon(Icons.upload, color: Colors.red),
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(7)),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expense', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12)), 
                        SizedBox(height: 4,),
                        Text('Rp 65.000.000', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14))
                      ],
                    )
                  ],
                )
              ],
            ),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16),
              )
            ),
          ),
            
            //2. membuat teks transaction
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Transactions', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ),
            
            //membuat widget dengan list tile
            //3. widget pengeluaran
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Icon(Icons.delete),
                    SizedBox(width: 10,) ,
                    Icon(Icons.edit)],
                  ),
                  title: Text('Rp 50.000'),
                  subtitle: Text('Makan Siang'),
                  leading: Container(
                          child: Icon(Icons.upload, color: Colors.red),
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.circular(7)),
                    )
                  ),
              ),
            ),
            
            //4. widget pemasukan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Icon(Icons.delete),
                    SizedBox(width: 10,) ,
                    Icon(Icons.edit)],
                  ),
                  title: Text('Rp 20.000.000'),
                  subtitle: Text('Gaji Bulanan'),
                  leading: Container(
                          child: Icon(Icons.upload, color: Colors.green),
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.circular(7)),
                    )
                  ),
              ),
            )
            
            ],
          )),
    );
  }
}