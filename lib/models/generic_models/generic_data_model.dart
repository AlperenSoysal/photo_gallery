/// Generic structure for all data types that enables for the data to be read
/// and saved locally with fromJSON() and toJSON() methods.
abstract class GenericModel {
  DateTime lastUpdated = DateTime.now();

  /// For saving the data as a JSON object
  Map<String, dynamic> toJSON();

  /// Factory for constructing the [GenericStruct] from a JSON object
  GenericModel.fromJSON(dynamic json);

  /// Generic constructor
  GenericModel(dynamic args);
}
