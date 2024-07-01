import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:portal/extensions/is_mobile_context.dart';
import 'package:portal/extensions/loc_ext.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  //TODO: RESPONSIVE

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
                      flex: context.isMobile ? 2 : 1,
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //TODO: submit form
                            //TODO: show indicator form submitted
                            //TODO: clear controllers && reset state
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
