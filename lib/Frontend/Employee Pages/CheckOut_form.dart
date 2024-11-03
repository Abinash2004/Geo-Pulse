import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Account/Date_Input.dart';
import 'package:geopulse/Frontend/Components/Account/Time_Input.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckOut extends StatefulWidget {
  
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Check Out Form",
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600,
            )),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 11.0,
            ),
          child: Column(
            children: [
              const TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const DateInputField(),
              const SizedBox(
                height: 8,
              ),
              const TimeInputField(title: 'Select CheckOut Time',),
              const SizedBox(
                height: 8,
              ),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              
              Row(
                children: [Expanded(child: Container()),
                  ElevatedButton(
                    style: const ButtonStyle(
                      
                    ),
                    onPressed: (){}, 
                    child: Text("Get Location")),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: MaterialButton(
                  onPressed: () {}, 
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('Submit',style: TextStyle(
                    color: Colors.white
                  ),),
                )
              )
            ],
          ),
        ),
      ) ,
    );
  }
}