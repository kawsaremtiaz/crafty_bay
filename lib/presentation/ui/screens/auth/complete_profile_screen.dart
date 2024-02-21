import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddressTEController = TextEditingController();
  final TextEditingController _cusCityTEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostCodeTEController = TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusMobileTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Full Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusAddressTEController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Your Address",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusCityTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "City",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter City";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusStateTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "State",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter State";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusPostCodeTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Post Code",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Post Code";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusCountryTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Country Name",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Country Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusMobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Mobile",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Mobile Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cusFaxTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Fax",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Fax Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                      return Visibility(
                        visible: completeProfileController.inProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final createProfileParams = CreateProfileParams(
                                cusName : _cusNameTEController.text.trim(),
                                cusAdd : _cusAddressTEController.text.trim(),
                                cusCity : _cusCityTEController.text.trim(),
                                cusState : _cusStateTEController.text.trim(),
                                cusPostcode :_cusPostCodeTEController.text.trim(),
                                cusCountry :_cusCountryTEController.text.trim(),
                                cusPhone :_cusMobileTEController.text.trim(),
                                cusFax :_cusFaxTEController.text.trim(),
                                shipName :_cusNameTEController.text.trim(),
                                shipAdd :_cusAddressTEController.text.trim(),
                                shipCity :_cusCityTEController.text.trim(),
                                shipState :_cusStateTEController.text.trim(),
                                shipPostcode :_cusPostCodeTEController.text.trim(),
                                shipCountry :_cusCountryTEController.text.trim(),
                                shipPhone :_cusMobileTEController.text.trim(),
                              );
                              final bool result =
                                  await completeProfileController
                                      .createProfileData(
                                    Get.find<VerifyOTPController>().token,
                                    createProfileParams
                                  );
                            if (result) {
                                Get.offAll(() => const MainBottomNavScreen());
                              } else {
                                  Get.showSnackbar(GetSnackBar(
                                  title: 'Complete profile failed',
                                  message: completeProfileController.errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                  ));
                              }
                            }
                          },
                          child: const Text('Complete'),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cusNameTEController.dispose();
    _cusAddressTEController.dispose();
    _cusCityTEController.dispose();
    _cusStateTEController.dispose();
    _cusPostCodeTEController.dispose();
    _cusCountryTEController.dispose();
    _cusMobileTEController.dispose();
    _cusFaxTEController.dispose();
    super.dispose();
  }
}
