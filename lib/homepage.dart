// ignore_for_file: prefer_const_constructors 

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas3pbm/dessert.dart';
import 'package:tugas3pbm/dessert_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of dessert types
  final List dessertType = [
    ['All', true,],
    ['Pudding', false,],
    ['Gelato', false,],
    ['Cupcake ', false,],
  ];

  //user tap dessert type
  void dessertTypeSelected(int index){
    setState(() {
      for(int i = 0; i < dessertType.length; i++){
        dessertType[i][1] = false;
      }
      dessertType[index][1] = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 241, 196),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Color.fromARGB(137, 110, 40, 40),),
        title: Center(
          child: Text(
            'Nazwa Dessert',
            style: GoogleFonts.gfsDidot(fontSize: 26, color: Color.fromARGB(255, 76, 22, 139), fontWeight: FontWeight.bold),
            ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.trolley, color: Color.fromARGB(137, 112, 26, 26),
            ),
        )
          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 55,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 199, 181, 173),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)
                ),
          ),
          child: Row(
            children: <Widget>[
            Expanded(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.home, color: Color.fromARGB(115, 175, 98, 98),)],
              ),
            )),
            Expanded(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.favorite, color: Color.fromARGB(115, 175, 98, 98),)],
              ),
            )),
            Expanded(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.category, color: Color.fromARGB(115, 175, 98, 98),)],
              ),
            )),
            Expanded(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.person, color: Color.fromARGB(115, 175, 98, 98),)],
              ),
            )),
            ],
          ),
      ),

      body:
        SafeArea(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 820,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black87,),
                            hintText: 'Cari Menu Disini',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 161, 160, 154),),
                              borderRadius: BorderRadius.circular(100.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 161, 160, 154),),
                              borderRadius: BorderRadius.circular(100.0)
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 161, 160, 154),
                          ),
                        ),
                      ),
                      Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dessertType.length,
                            itemBuilder: ((context, index) 
                          {
                            return DessertType(
                              desserttype: dessertType[index][0], 
                              isSelected: dessertType[index][1], 
                              onTap: (){{
                                dessertTypeSelected(index);
                              }});
                          }))

                        ),
                         SizedBox(height: 20,),

                        Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Dessert(
                              dessertImagePath: 'img/cupcake.png',
                              dessertName: 'Cupcake',
                              dessertIngridient: 'Sweet Chocolate',
                              dessertPrice: '20',
                            ),
                            Dessert(
                              dessertImagePath: 'img/gelato.png',
                              dessertName: 'Gelato',
                              dessertIngridient: 'Whipped Cream',
                              dessertPrice: '28',
                            ),
                            Dessert(
                              dessertImagePath: 'img/pudding.png',
                              dessertName: 'Pudding',
                              dessertIngridient: 'Jelly',
                              dessertPrice: '25',
                            ),
                          ],
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Menu special",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 250,
                              child: Dessert(
                                dessertImagePath: 'img/aice.png',
                                dessertName: 'Sweet Corn',
                                dessertIngridient: 'Corn Syrup',
                                dessertPrice: '10',
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Dessert(
                                dessertImagePath: 'img/walls.png',
                                dessertName: 'Cookies and Cream',
                                dessertIngridient: 'Sandwich Oreo',
                                dessertPrice: '30',
                              ),
                            ),
                          ],
                        ),
                        ),
                  ],
                ),

              ),
              
            ],
          ))
    );
  }
}