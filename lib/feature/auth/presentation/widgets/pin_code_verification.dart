import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerification extends StatefulWidget {
  const PinCodeVerification({
    super.key,
    this.verifyOTP,
    this.resendOTP,
    required this.otpCodeController,
    required this.isLoading,
  });

  final void Function()? verifyOTP;
  final void Function()? resendOTP;
  final bool isLoading;
  final TextEditingController otpCodeController;

  @override
  State<PinCodeVerification> createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AutofillGroup(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                controller: widget.otpCodeController,
                errorTextSpace: 40,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveColor: Color(0xFF638285),
                  activeColor: Color(0xFF638285),
                  selectedColor: Color(0xFF638285),
                ),
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                useExternalAutoFillGroup: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the OTP";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.verifyOTP!.call();
                    }
                  },
                  child:
                      widget.isLoading == true
                          ? CircularProgressIndicator()
                          : Text(
                            'Verify',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: Colors.white),
                          ),
                ),
              ),
              SizedBox(height: 22),
              GestureDetector(
                onTap: () {
                  widget.resendOTP!.call();
                },
                child: Text(
                  'Resend OTP Code',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
