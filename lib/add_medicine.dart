import 'package:flutter/material.dart';

class AddMedicinesScreen extends StatefulWidget {
  @override
  _AddMedicinesScreenState createState() => _AddMedicinesScreenState();
}

class _AddMedicinesScreenState extends State<AddMedicinesScreen> {
  int selectedCompartment = 1;
  int selectedColor = 0;
  int selectedType = 0;
  int quantity = 1;
  int totalCount = 1;
  String frequency = 'Everyday';
  String timesPerDay = 'Three Time';
  String selectedFoodOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Medicines',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Medicine Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Compartment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(10, 50),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: selectedCompartment == index + 1
                              ? Colors.blue
                              : Colors.grey[300]!,
                        ),
                      ),
                    ),
                    surfaceTintColor: MaterialStatePropertyAll(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      selectedCompartment == index + 1
                          ? Colors.blue[50]
                          : Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCompartment = index + 1;
                    });
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            Text(
              'Colour',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Colors.pink,
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow
              ].asMap().entries.map((entry) {
                int idx = entry.key;
                Color color = entry.value;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = idx;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: selectedColor == idx
                          ? Border.all(color: Colors.blue, width: 1)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 12,
              runSpacing: 12,
              children: [
                {'icon': Icons.circle_sharp, 'label': 'Tablet'},
                {'icon': Icons.medication_outlined, 'label': 'Capsule'},
                {'icon': Icons.medical_services_sharp, 'label': 'Cream'},
                {'icon': Icons.medication_liquid_rounded, 'label': 'Liquid'}
              ].asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> data = entry.value;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = idx;
                    });
                  },
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedType == idx ? Colors.blue : Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          data['icon'],
                          color: selectedType == idx
                              ? [
                                  Colors.pink,
                                  Colors.red,
                                  Colors.green,
                                  Colors.blue,
                                  Colors.yellow
                                ][selectedColor]
                              : [
                                  Colors.pink,
                                  Colors.red,
                                  Colors.green,
                                  Colors.blue,
                                  Colors.yellow
                                ][selectedColor],
                        ),
                        SizedBox(height: 5),
                        Text(
                          data['label'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Quantity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      )),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      ' Take $quantity Pill',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff6f8bef),
                    ),
                    // color: Color(0xff6f8bef),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Color(0xff6f8bef),
                    ),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff6f8bef),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Count',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    '$totalCount',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Slider(
                  activeColor: Color(0xff6f8bef),
                  value: totalCount.toDouble(),
                  min: 1,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      totalCount = value.toInt();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '01',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Set Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.grey,
                          )
                        ],
                      )),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'End Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 12,
                          )
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Frequency of Days',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              focusColor: Colors.white,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 50.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey), // Change this as needed
                ),
              ),
              value: frequency,
              items: ['Everyday', 'Alternate Days', 'Weekly']
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  frequency = value!;
                });
              },
              // decoration: InputDecoration(
              //   labelText: 'Frequency of Days',
              // ),
            ),
            SizedBox(height: 16),
            Text(
              'How many times a day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              icon: Icon(Icons.keyboard_arrow_down_rounded),

              focusColor: Colors.white,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 50.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey), // Change this as needed
                ),
              ),
              style: TextStyle(),
              value: timesPerDay,
              items: ['One Time', 'Two Time', 'Three Time']
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  timesPerDay = value!;
                });
              },
              // decoration: InputDecoration(labelText: 'How many times a Day'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  ['Before Food', 'After Food', 'Before Sleep'].map((text) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFoodOption = text;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedFoodOption == text
                          ? Color(0xff6f8bef)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xff6f8bef),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    alignment: Alignment.center,
                    surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      height: 310,
                      // width: 400,
                      // padding: EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Your Device is not connected",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 16),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'images/dialog.png',
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 20),

                              Text(
                                "Connect your device with",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.only(
                                        // topLeft: Radius.circular(12),
                                        // bottomLeft: Radius.circular(12),
                                        ),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                          // topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.bluetooth,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    // borderRadius: BorderRadius.only(
                                    //   topRight: Radius.circular(12),
                                    //   bottomRight: Radius.circular(12),
                                    // ),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                          // topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.wifi, color: Colors.white),
                                        ],
                                      ),
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
                );
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
