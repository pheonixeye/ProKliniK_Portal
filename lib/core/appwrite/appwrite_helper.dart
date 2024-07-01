import 'package:appwrite/appwrite.dart';
import 'package:portal/models/form_submission_model.dart';

class AppWriteHelper {
  AppWriteHelper() {
    db = Databases(_client);
  }

  static final Client _client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(const String.fromEnvironment("project_id"));
  late final Databases db;

  Future<void> sendFormSubmission(FormSubmission submission) async {
    try {
      await db.createDocument(
        databaseId: const String.fromEnvironment("database_id"),
        collectionId: const String.fromEnvironment("collection_id"),
        documentId: ID.unique(),
        data: submission.toJson(),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
