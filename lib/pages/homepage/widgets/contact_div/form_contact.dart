import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portal/core/appwrite/appwrite_helper.dart';
import 'package:portal/extensions/is_mobile_context.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/main.dart';
import 'package:portal/models/form_submission_model.dart';
import 'package:portal/widgets/snakbars.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  //todo: RESPONSIVE

  final formKey = GlobalKey<FormState>();
  String? _state;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _resetState() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _messageController.clear();
    _state = null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,

      ///contact form
      child: Card.outlined(
        elevation: 6,
        color: Colors.amber.shade100,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  context.loc.contact,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(context.loc.plansToPowerBus),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  context.loc.existingCustomer,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RadioListTile(
                        contentPadding: context.isMobile
                            ? const EdgeInsets.symmetric(horizontal: 4)
                            : null,
                        title: Text(context.loc.yes),
                        value: "yes",
                        groupValue: _state,
                        onChanged: (value) {
                          setState(() {
                            _state = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        contentPadding: context.isMobile
                            ? const EdgeInsets.symmetric(horizontal: 4)
                            : null,
                        title: Text(context.loc.no),
                        value: "no",
                        groupValue: _state,
                        onChanged: (value) {
                          setState(() {
                            _state = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: RadioListTile(
                        contentPadding: context.isMobile
                            ? const EdgeInsets.symmetric(horizontal: 4)
                            : null,
                        title: Text(context.loc.onTrial),
                        value: "ontrial",
                        groupValue: _state,
                        onChanged: (value) {
                          setState(() {
                            _state = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text("${context.loc.fullName} *"),
                subtitle: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.loc.enterName;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text("${context.loc.email} *"),
                subtitle: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || !EmailValidator.validate(value)) {
                      return context.loc.enterEmail;
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text("${context.loc.phone} *"),
                subtitle: TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.loc.enterPhone;
                    }
                    if (value.length < 11) {
                      return context.loc.validatePhone;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text("${context.loc.helpYouWith} *"),
                subtitle: SizedBox(
                  height: context.isMobile ? 100 : 200,
                  child: TextFormField(
                    controller: _messageController,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.loc.enterMessage;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(context.isMobile ? 8 : 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide()),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //todo: submit form
                            final sub = FormSubmission(
                              username: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              message: _messageController.text,
                              status: _state,
                            );
                            final helper = AppWriteHelper();
                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                  child: CircularProgressIndicator.adaptive()),
                            );

                            try {
                              await helper.sendFormSubmission(sub).then((_) {
                                //todo: show indicator form submitted
                                GoRouter.of(context).pop();
                              });
                              if (context.mounted) {
                                scaffoldMessengerKey.currentState
                                    ?.showSnackBar(snackBar(
                                  context.loc.success,
                                  Colors.green,
                                ));
                              }
                              _resetState();
                            } catch (e) {
                              if (context.mounted) {
                                scaffoldMessengerKey.currentState
                                    ?.showSnackBar(snackBar(
                                  context.loc.failed,
                                  Colors.red,
                                ));
                              }
                            }

                            //todo: clear controllers && reset state
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(context.isMobile ? 16 : 24.0),
                          child: Text(context.loc.contact),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
