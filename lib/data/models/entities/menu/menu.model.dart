import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    required this.userId,
    required this.applicationId,
    required this.application,
    required this.statusId,
    required this.status,
    required this.grantAccessRoles,
    required this.isFavorite,
    required this.user,
    required this.counter,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  int userId;
  int applicationId;
  dynamic application;
  int statusId;
  dynamic status;
  List<GrantAccessRole> grantAccessRoles;
  bool isFavorite;
  dynamic user;
  int counter;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory Menu.fromVoid() => Menu(
        userId: 0,
        applicationId: 0,
        application: "",
        statusId: 0,
        status: "",
        grantAccessRoles: [],
        isFavorite: false,
        user: "",
        counter: 0,
        id: 0,
        creationDate: DateTime.now(),
        modificationDate: DateTime.now(),
        userCreate: 0,
        userModify: 0,
      );

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        userId: json["UserId"],
        applicationId: json["ApplicationId"],
        application: json["Application"],
        statusId: json["StatusId"],
        status: json["Status"],
        grantAccessRoles: List<GrantAccessRole>.from(
            json["GrantAccessRoles"].map((x) => GrantAccessRole.fromJson(x))),
        isFavorite: json["IsFavorite"],
        user: json["User"],
        counter: json["Counter"],
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "ApplicationId": applicationId,
        "Application": application,
        "StatusId": statusId,
        "Status": status,
        "GrantAccessRoles":
            List<dynamic>.from(grantAccessRoles.map((x) => x.toJson())),
        "IsFavorite": isFavorite,
        "User": user,
        "Counter": counter,
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}

class GrantAccessRole {
  GrantAccessRole({
    required this.grantAccessId,
    required this.grantAccess,
    required this.roleId,
    required this.role,
    required this.authenticationTypeRef,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  int grantAccessId;
  dynamic grantAccess;
  int roleId;
  Role role;
  dynamic authenticationTypeRef;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory GrantAccessRole.fromJson(Map<String, dynamic> json) =>
      GrantAccessRole(
        grantAccessId: json["GrantAccessId"],
        grantAccess: json["GrantAccess"],
        roleId: json["RoleId"],
        role: Role.fromJson(json["Role"]),
        authenticationTypeRef: json["AuthenticationTypeRef"],
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "GrantAccessId": grantAccessId,
        "GrantAccess": grantAccess,
        "RoleId": roleId,
        "Role": role.toJson(),
        "AuthenticationTypeRef": authenticationTypeRef,
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}

class Role {
  Role({
    required this.name,
    required this.applicationId,
    required this.application,
    required this.statusId,
    required this.status,
    required this.roleMenuItems,
    required this.roleCustomAccess,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  String name;
  int applicationId;
  dynamic application;
  int statusId;
  dynamic status;
  List<RoleMenuItem> roleMenuItems;
  List<dynamic> roleCustomAccess;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["Name"],
        applicationId: json["ApplicationId"],
        application: json["Application"],
        statusId: json["StatusId"],
        status: json["Status"],
        roleMenuItems: List<RoleMenuItem>.from(
            json["RoleMenuItems"].map((x) => RoleMenuItem.fromJson(x))),
        roleCustomAccess:
            List<dynamic>.from(json["RoleCustomAccess"].map((x) => x)),
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "ApplicationId": applicationId,
        "Application": application,
        "StatusId": statusId,
        "Status": status,
        "RoleMenuItems":
            List<dynamic>.from(roleMenuItems.map((x) => x.toJson())),
        "RoleCustomAccess": List<dynamic>.from(roleCustomAccess.map((x) => x)),
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}

class RoleMenuItem {
  RoleMenuItem({
    required this.roleId,
    required this.menuItemId,
    required this.isActive,
    required this.role,
    required this.menuItem,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  int roleId;
  int? menuItemId;
  bool isActive;
  dynamic role;
  MenuItem menuItem;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory RoleMenuItem.fromJson(Map<String, dynamic> json) => RoleMenuItem(
        roleId: json["RoleId"],
        menuItemId: json["MenuItemId"] == null ? null : json["MenuItemId"],
        isActive: json["IsActive"],
        role: json["Role"],
        menuItem: MenuItem.fromJson(json["MenuItem"]),
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "RoleId": roleId,
        "MenuItemId": menuItemId == null ? null : menuItemId,
        "IsActive": isActive,
        "Role": role,
        "MenuItem": menuItem.toJson(),
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}

class MenuItem {
  MenuItem({
    required this.name,
    required this.isParent,
    required this.order,
    required this.applicationId,
    required this.application,
    required this.menuItems,
    required this.statusId,
    required this.status,
    required this.url,
    required this.menuItemId,
    required this.icon,
    required this.hidden,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  String name;
  bool isParent;
  int order;
  int applicationId;
  dynamic application;
  List<MenuItem>? menuItems;
  int statusId;
  dynamic status;
  String url;
  int? menuItemId;
  String icon;
  bool hidden;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["Name"],
        isParent: json["IsParent"],
        order: json["Order"],
        applicationId: json["ApplicationId"],
        application: json["Application"],
        menuItems: json["MenuItems"] == null
            ? null
            : List<MenuItem>.from(
                json["MenuItems"].map((x) => MenuItem.fromJson(x))),
        statusId: json["StatusId"],
        status: json["Status"],
        url: json["Url"],
        menuItemId: json["MenuItemId"] == null ? null : json["MenuItemId"],
        icon: json["Icon"],
        hidden: json["Hidden"],
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "IsParent": isParent,
        "Order": order,
        "ApplicationId": applicationId,
        "Application": application,
        "MenuItems": menuItems == null
            ? null
            : List<dynamic>.from(menuItems!.map((x) => x.toJson())),
        "StatusId": statusId,
        "Status": status,
        "Url": url,
        // ignore: unnecessary_null_comparison
        "MenuItemId": menuItemId == null ? null : menuItemId,
        "Icon": icon,
        "Hidden": hidden,
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}
