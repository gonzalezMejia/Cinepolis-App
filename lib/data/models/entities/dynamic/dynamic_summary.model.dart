import 'dart:convert';

class DynamicSummary {
    DynamicSummary({
        required this.title,
        required this.action,
        required this.fields,
    });

    String title;
    Action? action;
    List<Field> fields;

    factory DynamicSummary.fromJson(String str) => DynamicSummary.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DynamicSummary.fromMap(Map<String, dynamic> json) => DynamicSummary(
        title: json["title"] == null ? null : json["title"],
        action: json["actions"] == null ? null : json["actions"],
        fields: List<Field>.from(json["fields"].map((x) => Field.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "action": action,
        "fields": List<dynamic>.from(fields.map((x) => x.toMap())),
    };
}

class Action {
    Action({
        this.text,
        this.icon,
        required this.route,
    });

    String? text;
    String? icon;
    String? route;

    factory Action.fromJson(String str) => Action.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Action.fromMap(Map<String, dynamic> json) => Action(
        text: json["text"] == null ? null : json["text"],
        icon: json["icon"] == null ? null : json["icon"],
        route: json["route"] == null ? null : json["route"],
    );

    Map<String, dynamic> toMap() => {
        "text": text == null ? null : text,
        "icon": icon == null ? null : icon,
        "route": route,
    };
}

class Field {
    Field({
        required this.type,
        this.value,
        this.fieldOptions,
        this.label,
        this.color,
        this.listValue,
        this.gridSplitChar,
        this.gridColumns,
        this.gridValues,
    });

    String type;
    String? value;
    FieldOptions? fieldOptions;
    String? label;
    String? color;
    List<ListValue>? listValue;
    String? gridSplitChar;
    List<GridColumn>? gridColumns;
    List<GridValue>? gridValues;

    factory Field.fromJson(String str) => Field.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Field.fromMap(Map<String, dynamic> json) => Field(
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
        fieldOptions: json["fieldOptions"] == null ? null : FieldOptions.fromMap(json["fieldOptions"]),
        label: json["label"] == null ? null : json["label"],
        color: json["color"] == null ? null : json["color"],
        listValue: json["listValue"] == null ? null : List<ListValue>.from(json["listValue"].map((x) => ListValue.fromMap(x))),
        gridSplitChar: json["gridSplitChar"] == null ? null : json["gridSplitChar"],
        gridColumns: json["gridColumns"] == null ? null : List<GridColumn>.from(json["gridColumns"].map((x) => GridColumn.fromMap(x))),
        gridValues: json["gridValues"] == null ? null : List<GridValue>.from(json["gridValues"].map((x) => GridValue.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "value": value == null ? null : value,
        "fieldOptions": fieldOptions == null ? null : fieldOptions!.toMap(),
        "label": label == null ? null : label,
        "color": color == null ? null : color,
        "listValue": listValue == null ? null : List<dynamic>.from(listValue!.map((x) => x.toMap())),
        "gridSplitChar": gridSplitChar == null ? null : gridSplitChar,
        "gridColumns": gridColumns == null ? null : List<dynamic>.from(gridColumns!.map((x) => x.toMap())),
        "gridValues": gridValues == null ? null : List<dynamic>.from(gridValues!.map((x) => x.toMap())),
    };
}

class FieldOptions {
    FieldOptions({
        this.width,
        this.heigth,
        this.multiline,
        this.align,
        this.fontSize,
        this.color
    });

    int? width;
    int? heigth;
    bool? multiline;
    String? align;
    int? fontSize;
    String? color;

    factory FieldOptions.fromJson(String str) => FieldOptions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FieldOptions.fromMap(Map<String, dynamic> json) => FieldOptions(
        width: json["width"] == null ? null : json["width"],
        heigth: json["heigth"] == null ? null : json["heigth"],
        multiline: json["multiline"] == null ? null : json["multiline"],
        align: json["align"] == null ? null : json["align"],
        fontSize: json["fontSize"] == null ? null : json["fontSize"],
        color: json["color"] == null ? null : json["color"],
    );

    Map<String, dynamic> toMap() => {
        "width": width == null ? null : width,
        "heigth": heigth == null ? null : heigth,
        "multiline": multiline == null ? null : multiline,
        "align": align == null ? null : align,
        "fontSize": fontSize == null ? null : fontSize,
        "color": color == null ? null : color,
    };
}

class GridColumn {
    GridColumn({
        required this.name,
    });

    String name;

    factory GridColumn.fromJson(String str) => GridColumn.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GridColumn.fromMap(Map<String, dynamic> json) => GridColumn(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };
}

class GridValue {
    GridValue({
        required this.content,
        this.link,
    });

    String content;
    String? link;

    factory GridValue.fromJson(String str) => GridValue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GridValue.fromMap(Map<String, dynamic> json) => GridValue(
        content: json["content"] == null ? null : json["content"],
        link: json["link"],
    );

    Map<String, dynamic> toMap() => {
        "content": content,
        "link": link,
    };
}

class ListValue {
    ListValue({
        required this.content,
        this.link,
        this.background,
    });

    String content;
    String? link;
    String? background;

    factory ListValue.fromJson(String str) => ListValue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ListValue.fromMap(Map<String, dynamic> json) => ListValue(
        content: json["content"] == null ? null : json["content"],
        link: json["link"] == null ? null : json["link"],
        background: json["background"] == null ? null : json["background"],
    );

    Map<String, dynamic> toMap() => {
        "content": content,
        "link": link == null ? null : link,
        "background": background == null ? null : background,
    };
}
