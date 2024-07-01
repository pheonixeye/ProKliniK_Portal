import 'package:appwrite/appwrite.dart';
import 'package:portal/models/form_submission_model.dart';

class AppWriteHelper {
  AppWriteHelper() {
    db = Databases(_client);
  }

  static final Client _client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      // .setProject(const String.fromEnvironment("project_id"));
      .setProject("6682fa2900317f2c4745");
  late final Databases db;

  Future<void> sendFormSubmission(FormSubmission submission) async {
    try {
      await db.createDocument(
        // databaseId: const String.fromEnvironment("database_id"),
        databaseId: "6682fafa00222db75362",
        // collectionId: const String.fromEnvironment("collection_id"),
        collectionId: "6682fb1b0014f086e355",
        documentId: ID.unique(),
        data: submission.toJson(),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
