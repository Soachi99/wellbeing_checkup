class SelectOption {
  String? label;
  String? icon;
  String? description;
  dynamic value;

  SelectOption(
      {required this.label, required this.value, this.icon, this.description});

  SelectOption.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['icon'] = icon;
    data['description'] = description;
    return data;
  }
}
