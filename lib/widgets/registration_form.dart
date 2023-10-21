// ignore_for_file: library_private_types_in_public_api, must_be_immutable, use_build_context_synchronously
import '../widgets/registration_form_widget.dart';
import 'package:flutter/material.dart';
import '../providers/controllers/user_controller.dart';
import '../providers/models/user.dart';
import '../screens/landing_screen.dart';

class RegistrationForm extends StatelessWidget {
  final Function setIsLoading;
  RegistrationForm(this.setIsLoading, {super.key});

  final UserController userController = UserController();

  final formKey = GlobalKey<FormState>();

  Map<String, String> data = {"name": "", "dateOfBirth": "", "phoneNumber": ""};

  setName(String name) {
    data["name"] = name;
  }

  setDOB(String dob) {
    data["dateOfBirth"] = dob;
  }

  setPhoneNo(String phoneNo) {
    data["phoneNumber"] = phoneNo;
  }

  validateName(String name) {
    if (name.isEmpty) {
      return "Please enter a valid name";
    }
  }

  validateDOB(String dob) {
    if (dob.isEmpty) {
      return "Please enter a valid date";
    } else if (dob.length != 8) {
      return "Please enter a dateformat in the described format";
    }
  }

  validatePhoneNo(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return "Enter a phone number";
    } else if (phoneNumber.length != 10) {
      return "Please enter a valid phone number";
    }
  }

  @override
  Widget build(BuildContext context) {
    savePersonalData() async {
      try {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          setIsLoading(true);
          // await Future.delayed(Duration(seconds: 10));
          User user = await userController.createUser(
              data["name"]!, data["dateOfBirth"]!, data["phoneNumber"]!);
          setIsLoading(false);
          Navigator.of(context).pushReplacementNamed(LandingScreen.rout);
        }
      } catch (exception) {
        throw Exception(exception);
      }
    }

    return Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegistrationFormWidget(
                  "Name", setName, "alpha", false, validateName),
              RegistrationFormWidget(
                  "Phone No", setPhoneNo, "number", false, validatePhoneNo),
              RegistrationFormWidget("Date Of Birth(in dd-mm-yy format)",
                  setDOB, "alpha", true, validateDOB),
              ElevatedButton(
                onPressed: savePersonalData,
                child: const Text("Save"),
              )
            ],
          ),
        ));
  }
}
