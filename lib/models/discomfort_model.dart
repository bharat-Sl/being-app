class Discomfort {
  late String uid;
  late String discomfort;
  late List<String> objectives;
  late String parentType;
  late String childType;

  Discomfort(
      {required this.uid,
      required this.discomfort,
      required this.objectives,
      required this.parentType,
      required this.childType});

  Discomfort.fromJson(var data) {
    this.uid = data["uid"];
    this.discomfort = data["discomfort"];
    this.objectives = [];
    data["objectives"].forEach((e) {
      this.objectives.add(e.toString());
    });
    this.parentType = data["parentType"];
    this.childType = data["childType"];
  }

  toJson() {
    var map = {
      "uid": uid,
      "discomfort": discomfort,
      "objectives": objectives,
      "parentType": parentType,
      "childType": childType
    };
    return map;
  }
}
