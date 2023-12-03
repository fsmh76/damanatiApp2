import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drafts/invoice.model.dart';





class Invoice extends StatefulWidget {
 

  @override
  State<Invoice> createState() => _InvoiceState();
}


class _InvoiceState extends State<Invoice> {

  late final Item item;


  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: Center(
       child:Container(

        child: Column(
          children: [
            Row(
              children: [

                Align(
                      alignment: Alignment.center,
                      child: Text(
                                item.itemName,
                            style:  GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                              
                            ),
                      ),
                    ),

                //icon

                IconButton(onPressed:(){}, icon: Icon(Icons.share_arrival_time_outlined))
              ],
            ),
            
             //
            //linear indicator
             Container(),



            Row(
              children: [

                // purchase date 
                Container(),

                //Category
                Container(),
              ],
             
            ),

            SizedBox(
              height: 15,
            ),

             Row(
              children: [

                // warranty Start date 
                Container(),

               Column(
                children: [
                      //warranty end date
                  Container(),

                  //add reminder button
                    Container()
                ],
               )
                //warranty end date
              ],
             
            ),

            Row(
              children: [

                // warranty contact 
                Container(),

                //Notes
                Container(),
              ],
             
            ),


            SizedBox(height: 10,),

            Row(

              //view invoice button


              //location button

            ),

            //delete button







          ],)

        )

      )



      ////////////////
      /// 
    );
  }
 
  }
