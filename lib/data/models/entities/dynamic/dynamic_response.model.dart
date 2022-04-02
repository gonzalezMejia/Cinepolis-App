// To parse this JSON data, do
//
//     final dynamicResponse = dynamicResponseFromJson(jsonString);

import 'dart:convert';

DynamicResponse dynamicResponseFromJson(String str) =>
    DynamicResponse.fromJson(json.decode(str));

String dynamicResponseToJson(DynamicResponse data) =>
    json.encode(data.toJson());

class DynamicResponse {
  DynamicResponse({
    required this.title,
    required this.actions,
    required this.fields,
  });

  String? title;
  List<Action>? actions;
  List<Field>? fields;

  factory DynamicResponse.fromVoid() => DynamicResponse(
        title: "",
        actions: [],
        fields: [],
      );

  factory DynamicResponse.fromJson(Map<String, dynamic> json) =>
      DynamicResponse(
        title: json["title"] == null ? null : json["title"],
        actions: json["actions"] == null
            ? null
            : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        fields: json["fields"] == null
            ? null
            : List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "actions": List<Action>.from(actions!.map((x) => x.toJson())),
        "fields": List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

class Action {
  Action({
    required this.text,
    required this.icon,
    required this.route,
  });

  String? text;
  String? icon;
  String? route;

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        text: json["text"] == null ? null : json["text"],
        icon: json["icon"] == null ? null : json["icon"],
        route: json["route"] == null ? null : json["route"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "route": route,
      };
}

class Field {
  Field({
    required this.type,
    required this.value,
    required this.fieldOptions,
    required this.listValues,
    required this.gridSplitChar,
    required this.gridColumns,
    required this.gridValues,
  });

  String? type;
  String? value;
  FieldOptions? fieldOptions;
  dynamic listValues;
  String? gridSplitChar;
  List<GridColumn>? gridColumns;
  List<GridValue>? gridValues;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
        fieldOptions: json["fieldOptions"] == null
            ? null
            : FieldOptions.fromJson(json["fieldOptions"]),
        listValues: json["listValues"],
        gridSplitChar:
            json["gridSplitChar"] == null ? null : json["gridSplitChar"],
        gridColumns: json["gridColumns"] == null
            ? null
            : List<GridColumn>.from(
                json["gridColumns"].map((x) => GridColumn.fromJson(x))),
        gridValues: json["gridValues"] == null
            ? null
            : List<GridValue>.from(
                json["gridValues"].map((x) => GridValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        // ignore: unnecessary_null_comparison
        "value": value == null ? null : value,
        "fieldOptions": fieldOptions == null ? null : fieldOptions!.toJson(),
        "listValues": listValues,
        // ignore: unnecessary_null_comparison
        "gridSplitChar": gridSplitChar == null ? null : gridSplitChar,
        "gridColumns": gridColumns == null
            ? null
            : List<dynamic>.from(gridColumns!.map((x) => x.toJson())),
        "gridValues": gridValues == null
            ? null
            : List<dynamic>.from(gridValues!.map((x) => x.toJson())),
      };
}

class FieldOptions {
  FieldOptions(
      {required this.width,
      required this.height,
      required this.multiline,
      required this.align,
      required this.color,
      required this.size,
      required this.padding});

  int? width;
  int? height;
  bool multiline;
  String? align;
  String? color;
  int? size;
  int? padding;

  factory FieldOptions.fromJson(Map<String, dynamic> json) => FieldOptions(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        multiline: json["multiline"] == null ? null : json["multiline"],
        align: json["align"] == null ? null : json["align"],
        color: json["color"] == null ? null : json["color"],
        size: json["size"] == 0 ? null : json["size"],
        padding: json["topPadding"] == 0 ? null : json["topPadding"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "multiline": multiline,
        "align": align,
        "color": color,
        "size": size,
        "topPadding": padding
      };
}

class GridColumn {
  GridColumn({
    required this.name,
  });

  String? name;

  factory GridColumn.fromJson(Map<String, dynamic> json) => GridColumn(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class GridValue {
  GridValue({
    required this.content,
    required this.link,
  });

  String? content;
  dynamic link;

  factory GridValue.fromJson(Map<String, dynamic> json) => GridValue(
        content: json["content"] == null ? null : json["content"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link,
      };
}
