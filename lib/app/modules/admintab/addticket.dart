import 'package:airpedia/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addticket extends StatefulWidget {
   addticket({Key? key}) : super(key: key);

  @override
  State<addticket> createState() => _addticketState();
}
TextEditingController dateInput = TextEditingController();
TextEditingController timeinput = TextEditingController();
TextEditingController Flightinput = TextEditingController();
TextEditingController priceinput = TextEditingController();
String date="";
String time="";
final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
final timeFormat = DateFormat("h:mm a");

class _addticketState extends State<addticket> {
  final List<String> items = [
    'Mumbai',
    'Kolkata',
    'Rajkot',
    'Surat',
    'Patan',
    'Jamnagar',
    'Morbi',
    'Ahmedabad',
  ];

  String? selectedOriginAirport;
  String? selectedDestinationAirport;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  final fireStore = FirebaseFirestore.instance.collection('dataupload');
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Ticket",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 540,
                        width: 300,
                        padding: EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 4.0,
                            style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("FLIGHT DETAILS",style: TextStyle(color: Colors.deepPurple,
                                fontSize: 20,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SizedBox(
                                height: 50,
                                width: 230,
                                child: TextField(
                                  controller: Flightinput,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    color: Colors.deepPurpleAccent
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(9)
                                    ),
                                    hintText: '',
                                    labelText: "Enter Flight Name",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 230,
                              child: Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.deepPurpleAccent),
                                  decoration: const InputDecoration(
                                      hintText: 'Date',
                                      hintStyle: TextStyle(color: Colors.black45),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black45, width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black45, width: 1)),
                                      //icon: Icon(Icons.calendar_month_outlined,color: Colors.deepOrange,)
                                  ),
                                  controller: dateInput,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2050),
                                        builder: (context, child){
                                          return Theme(data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: Colors.deepPurpleAccent,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme: TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                          ), child: child!,
                                          );
                                        }
                                    );

                                    // if (pickedDate != null) {
                                    //   dateInputController.text =pickedDate.toString();
                                    // }
                                    if (pickedDate != null) {
                                      dateInput.text =
                                          DateFormat('dd MMMM yyyy').format(pickedDate);
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: SizedBox(
                                height: 50,
                                width: 230,
                                child: Container(
                                  //height: MediaQuery.of(context).size.width / 3,
                                  child: TextField(
                                    style: TextStyle(color: Colors.deepPurpleAccent),
                                    controller: timeinput, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        hintText: 'Time',
                                        hintStyle: TextStyle(color: Colors.black45),
                                        //icon: Icon(Icons.timer), //icon of text field
                                        //labelText: "Enter Time" , //label text of field
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black45, width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black45, width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black45, width: 1)),
                                        //icon: Icon(Icons.access_time_sharp,color: Colors.deepOrange,)
                                    ),

                                    readOnly: true,  //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      TimeOfDay? pickedTime =  await showTimePicker(
                                          initialTime: TimeOfDay(hour: 12,minute: 00),
                                          context: context,
                                          builder: (context, child)
                                          {
                                            return Theme(data: Theme.of(context).copyWith(
                                              colorScheme: ColorScheme.light(
                                                primary: Colors.deepPurpleAccent,
                                                onPrimary: Colors.white,
                                                onSurface: Colors.black,
                                              ),
                                              textButtonTheme: TextButtonThemeData(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.deepPurpleAccent,
                                                ),
                                              ),
                                            ), child: child!,
                                            );
                                          }
                                      );

                                      if(pickedTime != null ){
                                        print(pickedTime.format(context));   //output 10:51 PM
                                        DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                        //converting to DateTime so that we can further format on different pattern.
                                        print(parsedTime); //output 1970-01-01 22:53:00.000
                                        String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                        print(formattedTime); //output 14:59:00
                                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                                        setState(() {
                                          timeinput.text = formattedTime; //set the value of text field.
                                        });
                                      }else{
                                        print("Time is not selected");
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 230,
                              child: TextField(
                                controller: priceinput,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(9)
                                  ),
                                  prefixText: "₹",
                                  hintText: '',
                                  labelText: "Ticket Price",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                width: 240,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Expanded(child: Text("OriginAirport")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Expanded(child:
                                      SizedBox(
                                        height: 60,
                                        width: 140,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: Text(
                                              'Select Airport',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Theme.of(context).hintColor,
                                              ),
                                            ),
                                            items: items
                                                .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.deepPurpleAccent
                                                ),
                                              ),
                                            ))
                                                .toList(),
                                            value: selectedOriginAirport,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOriginAirport = value;
                                              });
                                            },
                                            buttonStyleData: const ButtonStyleData(
                                              padding: EdgeInsets.symmetric(horizontal: 16),
                                              height: 40,
                                              width: 200,
                                            ),
                                            dropdownStyleData: const DropdownStyleData(
                                              maxHeight: 200,
                                            ),
                                            menuItemStyleData: const MenuItemStyleData(
                                              height: 40,
                                            ),
                                            dropdownSearchData: DropdownSearchData(
                                              searchController: textEditingController,
                                              searchInnerWidgetHeight: 50,
                                              searchInnerWidget: Container(
                                                height: 50,
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 4,
                                                  right: 8,
                                                  left: 8,
                                                ),
                                                child: TextFormField(
                                                  expands: true,
                                                  maxLines: null,
                                                  controller: textEditingController,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding: const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8,
                                                    ),
                                                    hintText: 'Search for an item...',
                                                    hintStyle: const TextStyle(fontSize: 12,color: Colors.deepPurpleAccent),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              searchMatchFn: (item, searchValue) {
                                                return item.value.toString().contains(searchValue);
                                              },
                                            ),
                                            //This to clear the search value when you close the menu
                                            onMenuStateChange: (isOpen) {
                                              if (!isOpen) {
                                                textEditingController.clear();
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 230,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Expanded(child: SizedBox(
                                      height: 50,
                                        width: 80,
                                        child: Text("Destination Airport"))),
                                  ),
                                  Expanded(child:
                                  SizedBox(
                                    height: 60,
                                    width: 140,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Airport',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: items
                                            .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.deepPurpleAccent
                                            ),
                                          ),
                                        ))
                                            .toList(),
                                        value: selectedDestinationAirport,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDestinationAirport = value;
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          height: 40,
                                          width: 200,
                                        ),
                                        dropdownStyleData: const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                        ),
                                        dropdownSearchData: DropdownSearchData(
                                          searchController: textEditingController,
                                          searchInnerWidgetHeight: 50,
                                          searchInnerWidget: Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              expands: true,
                                              maxLines: null,
                                              controller: textEditingController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search for an item...',
                                                hintStyle: const TextStyle(fontSize: 12,color: Colors.deepPurpleAccent),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchMatchFn: (item, searchValue) {
                                            return item.value.toString().contains(searchValue);
                                          },
                                        ),
                                        //This to clear the search value when you close the menu
                                        onMenuStateChange: (isOpen) {
                                          if (!isOpen) {
                                            textEditingController.clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40,
                              width: 90,
                              child: ElevatedButton(onPressed: (){
                                setState(() {
                                  loading = true;
                                });
                                String id =  DateTime.now().microsecondsSinceEpoch.toString();
                                fireStore.doc(id).set({
                                  'Flightname' : Flightinput.text.toString(),
                                  'Flightdate' : dateInput.text.toString(),
                                  'Flighttime' : timeinput.text.toString(),
                                  'Flightprice' : priceinput.text.toString(),
                                  "selectedOriginAirport": selectedOriginAirport,
                                  "selectedDestinationAirport" : selectedDestinationAirport,
                                  'id' : id
                                }).then((value) {
                                  final snackBar = SnackBar(content: const Text('upload data'),
                                    action: SnackBarAction(label: '', onPressed:(){
                                    }),
                                  );
                                  Flightinput.text="";
                                  dateInput.text="";
                                  timeinput.text="";
                                  priceinput.text="";
                                  selectedOriginAirport="";
                                  selectedDestinationAirport="";
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }).onError((error, stackTrace) {
                                  //Utils().toastMessage(error.toString());
                                });
                              },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,
                                  elevation: 12.0,
                                    textStyle: TextStyle(color: Colors.white,)
                                  ),
                                  child: Text("Add",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
                                  ),
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

