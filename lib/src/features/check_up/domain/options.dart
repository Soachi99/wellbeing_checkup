import 'dart:convert';

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));

String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
  List<Option> options;

  Options({
    required this.options,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  String id;
  String name;
  int minutes;
  bool disabled;
  String image;

  Option({
    required this.id,
    required this.name,
    required this.minutes,
    required this.disabled,
    required this.image,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        minutes: json["minutes"],
        disabled: json["disabled"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minutes": minutes,
        "disabled": disabled,
        "image": image,
      };
}
