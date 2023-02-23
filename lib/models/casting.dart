import 'dart:convert';

class Cast {
    Cast({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<CastElement> cast;
    List<CastElement> crew;

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        id: json["id"],
        cast: List<CastElement>.from(json["cast"].map((x) => CastElement.fromJson(x))),
        crew: List<CastElement>.from(json["crew"].map((x) => CastElement.fromJson(x))),
    );

}

class CastElement {
    CastElement({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        required this.castId,
        required this.character,
        required this.creditId,
        required this.order,
        required this.department,
        required this.job,
    });

    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String profilePath;
    int castId;
    String character;
    String creditId;
    int order;
    String department;
    String job;

    factory CastElement.fromJson(String str) => CastElement.fromMap(json.decode(str));

    factory CastElement.fromMap(Map<String, dynamic> json) => CastElement(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

}
