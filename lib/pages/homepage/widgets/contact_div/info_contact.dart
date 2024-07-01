import 'package:flutter/material.dart';
import 'package:portal/extensions/loc_ext.dart';
import 'package:portal/pages/homepage/widgets/map_view.dart';

class InfoContact extends StatelessWidget {
  const InfoContact({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: RESPONSIVE

    return Expanded(
      flex: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.letsTalk,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(context.loc.haveQuestions),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    title: Text(
                      context.loc.callUs,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      "+201555905768",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide()),
                  ),
                  onPressed: () {},
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    title: Text(context.loc.emailUs),
                    subtitle: const Text("info@ProKliniK.app"),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            leading: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            title: Text(context.loc.visitHelpCenter),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            leading: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            isThreeLine: true,
            title: Text(context.loc.visitUsPersonally),
            subtitle: Text.rich(
              TextSpan(
                text: '',
                children: [
                  TextSpan(text: "${context.loc.addressOne}\n"),
                  TextSpan(text: "${context.loc.addressTwo}\n"),
                  TextSpan(text: "${context.loc.addressThree}\n"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const MapViewContainer()
        ],
      ),
    );
  }
}
