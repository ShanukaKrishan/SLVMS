import 'package:flutter/material.dart';
import 'package:fyp/screens/login/login.dart';
import 'Steps/IdentityStep.dart';
import 'Steps/PersonalDetailStep.dart';
import 'Steps/RegisterationStep.dart';
import 'Steps/EmailStep.dart';
import 'components/CustomAppBar.dart';

class OnBoardingForm extends StatefulWidget {
  @override
  _OnBoardingFormState createState() => _OnBoardingFormState();
}

class _OnBoardingFormState extends State<OnBoardingForm> {
  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(""),
          content: IdentityStep(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(""),
          content: PersonalDetailsStep(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text(""),
          content: RegistrationStep(),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text(""),
          content: EmailStep(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(
          child: CustomAppBar(),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.black,
          ),
          primaryColor: Colors.black,
          shadowColor: Colors.transparent,
          canvasColor: Colors.white,
        ),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              Navigator.pushNamed(context, LoginScreen.routeName);
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (currentStep == 0)
                  Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: controls.onStepContinue,
                      child: const Text(
                        'Check Identity',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (currentStep == 1)
                  Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: controls.onStepContinue,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (currentStep == 2)
                  Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: controls.onStepContinue,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (currentStep == 3)
                  Container(
                    height: 50,
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: controls.onStepContinue,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
