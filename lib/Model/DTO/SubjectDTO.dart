class SubjectDTO {
  int? id;
  String? name;

  SubjectDTO({this.id, this.name});

  SubjectDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  static List<SubjectDTO> fromList(dynamic jsonList) {
    var list = jsonList as List;
    return list.map((map) => SubjectDTO.fromJson(map)).toList();
  }
}
