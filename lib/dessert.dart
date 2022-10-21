import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas3pbm/dessert_desc.dart';

class Dessert extends StatelessWidget {
  final String dessertImagePath;
  final String dessertName;
  final String dessertIngridient;
  final String dessertPrice;

  Dessert({
    required this.dessertImagePath, 
    required this.dessertName, 
    required this.dessertIngridient, 
    required this.dessertPrice,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(221, 98, 3, 96),
          ),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //dessert image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Center(child: Image.asset(dessertImagePath, width: 100, height: 100,))
                ),

              //dessert name
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        dessertName,
                        style: GoogleFonts.gfsDidot(fontSize: 20, color: const Color.fromARGB(255, 199, 181, 173),),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        dessertIngridient,
                        style: GoogleFonts.poppins(fontSize: 12, color: const Color.fromARGB(255, 199, 181, 173),),
                        ),
                    ),
                    //price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('\$' + dessertPrice, style: GoogleFonts.poppins(fontSize: 16, color: const Color.fromARGB(255, 200, 140, 71)), ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 179, 121, 41),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Icon(Icons.add)),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DessertDesc(dessertImagePath: this.dessertImagePath, dessertName: this.dessertName)),);
                          },
                      ),
                    ],)
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}