import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/Account/Date_Input.dart';
import 'package:geopulse/Frontend/Components/Account/Time_Input.dart';
import 'package:google_fonts/google_fonts.dart';



class CheckinForm extends StatefulWidget {

  const CheckinForm({super.key});

  @override
  State<CheckinForm> createState() => _CheckinFormState();
}

class _CheckinFormState extends State<CheckinForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Check In Form",
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600,
            )),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
            ),
          child: Column(
            children: [
              const DateInputField(),
              const SizedBox(
                height: 20,
              ),
              const TimeInputField(title: 'Select Checkin Time',),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [Expanded(child: Container()),
                  ElevatedButton(
                    style: const ButtonStyle(
                      
                    ),
                    onPressed: (){}, 
                    child: const Text("Get Location")),
                ],
              ),
              const SizedBox(
                height: 30,
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