// class QuranModel {
//   int? code;
//   String? status;
//   Data? data;

//   QuranModel({required this.code, required this.status, required this.data});

//   factory QuranModel.fromJson(Map<String, dynamic> json) {
//     return QuranModel(
//         code: json['code'],
//         data: json['data'] != null ? Data.fromJson(json['data']) : null,
//         status: json['status']);
//   }
// }

// class Data {
//   List<Surahs>? surahs;

//   Data({required this.surahs});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//         surahs: json['surahs'] != null
//             ? (json['surahs'] as List).map((v) => Surahs.fromJson(v)).toList()
//             : null);
//   }
// }

// class Surahs {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   String? revelationType;
//   List<Ayahs>? ayahs;

//   Surahs(
//       {required this.number,
//       required this.name,
//       required this.englishName,
//       required this.englishNameTranslation,
//       required this.revelationType,
//       required this.ayahs});

//   factory Surahs.fromJson(Map<String, dynamic> json) {
//     return Surahs(
//         number: json['number'],
//         name: json['name'],
//         englishName: json['englishName'],
//         englishNameTranslation: json['englishNameTranslation'],
//         revelationType: json['revelationType'],
//         ayahs: json['ayahs'] != null
//             ? (json['ayahs'] as List).map((v) => Ayahs.fromJson(v)).toList()
//             : null);
//   }
// }

// class Ayahs {
//   int? number;
//   String? audio;
//   List<String>? audioSecondary;
//   String? text;
//   String? ayaTextEmlaey;
//   int? numberInSurah;
//   int? juz;
//   int? manzil;
//   int? page;
//   int? pageInSurah;
//   int? ruku;
//   int? hizbQuarter;
//   bool? sajda;
//   String? codeV2;

//   Ayahs(
//       {this.number,
//       this.audio,
//       this.audioSecondary,
//       this.text,
//       this.ayaTextEmlaey,
//       this.numberInSurah,
//       this.juz,
//       this.manzil,
//       this.page,
//       this.pageInSurah,
//       this.ruku,
//       this.hizbQuarter,
//       this.sajda,
//       this.codeV2});

//   factory Ayahs.fromJson(Map<String, dynamic> json) {
//     return Ayahs(
//       audio: json['audio'],
//       text: json['text'],
//       audioSecondary: json['audioSecondary'],
//       ayaTextEmlaey: json['ayaTextEmlaey'],
//       codeV2: json['code_v2'],
//       hizbQuarter: json['hizbQuarter'],
//       juz: json['juz'],
//       manzil: json['manzil'],
//       number: json['number'],
//       numberInSurah: json['numberInSurah'],
//       page: json['page'],
//       pageInSurah: json['pageInSurah'],
//       sajda: json['sajda']!=false?SajdaClass.fromJson(json['sajda']):json['sajda'],
//       ruku: json['ruku'],

//     );
//   }
// }
// class SajdaClass {
//     final int id;
//     final bool recommended;
//     final bool obligatory;

//     SajdaClass({
//         required this.id,
//         required this.recommended,
//         required this.obligatory,
//     });

//  factory SajdaClass.fromJson(Map<String, dynamic> json) {
//     return SajdaClass(
//         id: json['id'],
//         recommended: json['recommended'],
//         obligatory: json['obligatory'],
//     );  }
// }
class QuranModel {
    QuranModel({
        required this.code,
        required this.status,
        required this.data,
    });

    final int? code;
    final String? status;
    final Data? data;

    factory QuranModel.fromJson(Map<String, dynamic> json){ 
        return QuranModel(
            code: json["code"],
            status: json["status"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.surahs,
    });

    final List<Surah> surahs;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            surahs: json["surahs"] == null ? [] : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
        );
    }

}

class Surah {
    Surah({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.revelationType,
        required this.ayahs,
    });

    final int? number;
    final String? name;
    final String? englishName;
    final String? englishNameTranslation;
    final String? revelationType;
    final List<Ayah> ayahs;

    factory Surah.fromJson(Map<String, dynamic> json){ 
        return Surah(
            number: json["number"],
            name: json["name"],
            englishName: json["englishName"],
            englishNameTranslation: json["englishNameTranslation"],
            revelationType: json["revelationType"],
            ayahs: json["ayahs"] == null ? [] : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
        );
    }

}

class Ayah {
    Ayah({
        required this.number,
        required this.audio,
        required this.audioSecondary,
        required this.text,
        required this.ayaTextEmlaey,
        required this.numberInSurah,
        required this.juz,
        required this.manzil,
        required this.page,
        required this.pageInSurah,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
        required this.codeV2,
    });

    final int? number;
    final String? audio;
    final List<String> audioSecondary;
    final String? text;
    final String? ayaTextEmlaey;
    final int? numberInSurah;
    final int? juz;
    final int? manzil;
    final int? page;
    final int? pageInSurah;
    final int? ruku;
    final int? hizbQuarter;
    final dynamic? sajda;
    final String? codeV2;

    factory Ayah.fromJson(Map<String, dynamic> json){ 
        return Ayah(
            number: json["number"],
            audio: json["audio"],
            audioSecondary: json["audioSecondary"] == null ? [] : List<String>.from(json["audioSecondary"]!.map((x) => x)),
            text: json["text"],
            ayaTextEmlaey: json["aya_text_emlaey"],
            numberInSurah: json["numberInSurah"],
            juz: json["juz"],
            manzil: json["manzil"],
            page: json["page"],
            pageInSurah: json["pageInSurah"],
            ruku: json["ruku"],
            hizbQuarter: json["hizbQuarter"],
            sajda: json["sajda"],
            codeV2: json["code_v2"],
        );
    }

}

class SajdaClass {
    SajdaClass({
        required this.id,
        required this.recommended,
        required this.obligatory,
    });

    final int? id;
    final bool? recommended;
    final bool? obligatory;

    factory SajdaClass.fromJson(Map<String, dynamic> json){ 
        return SajdaClass(
            id: json["id"],
            recommended: json["recommended"],
            obligatory: json["obligatory"],
        );
    }

}
