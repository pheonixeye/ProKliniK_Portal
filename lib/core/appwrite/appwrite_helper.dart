import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:portal/models/form_submission_model.dart';

class AppWriteHelper {
  AppWriteHelper() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject(Platform.environment["project_id"]);
  }

  static final Client client = Client();
  final Databases db = Databases(client);

  Future<bool> sendFormSubmission(FormSubmission submission) async {
    try {
      await db.createDocument(
        databaseId: Platform.environment["database_id"]!,
        collectionId: Platform.environment["collection_id"]!,
        documentId: ID.unique(),
        data: submission.toJson(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
