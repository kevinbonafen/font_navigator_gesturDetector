import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isExpense = true;
  List<String> list = ['Makan', 'Transportasi', 'Nonton Film'];
  late String dropDownValue = list.first;
  TextEditingController dateController = TextEditingController();
  @override
  
  //1. membuat AppBar transaction
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Add Transaction'),),
    
    //2. membuat tombol switch expense/income
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Switch(
              value: isExpense, 
              onChanged: (bool value) {
                setState(() {
                  isExpense = value;
                });
              }, 
              inactiveTrackColor: Colors.green[200], 
              inactiveThumbColor: Colors.green,
              activeColor: Colors.red,
              ),
              Text(isExpense ? 'Expense' : 'Income', 
              style: GoogleFonts.montserrat(fontSize: 14),)
          ],
            ),
            SizedBox(height: 10,),
            
            //3. widget amount
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(), 
                  labelText: 'Amount'),
              ),
            ),
            
            SizedBox(height: 25,),

            //4. widget categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Category', 
                style: GoogleFonts.montserrat(fontSize: 16),),
            ),
            
            //membuat widget dropdown/pilihan category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: dropDownValue,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value, 
                  child: Text(value),
                  );
                }
              ).toList(),
                
                onChanged: (String? value) {
            
              }),
            ),
            SizedBox(
              height: 25,
              ),
            
            //5. widget enter date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(labelText: "Enter Date"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2020), 
                    lastDate: DateTime(2099));
            
                  if (pickedDate != null) {
                    String formattedDate = 
                       DateFormat('yyyy-MM-dd').format(pickedDate);
            
                    dateController.text = formattedDate;
                  }
                },
                ),
            ),

            SizedBox(
              height: 25,
            ),
            Center(child: ElevatedButton(onPressed: (){}, child: Text("Save")))
          ],
        )
      )
    ),
  );
}
}