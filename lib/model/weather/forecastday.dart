import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class Forecastday {
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.dateEpoch, this.day, this.astro, this.hour});

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? Day.fromJson(<String, dynamic>{})
            : Day.fromJson(json['day'] as Map<String, dynamic>),
        astro: json['astro'] == null
            ? Astro.fromJson(<String, dynamic>{})
            : Astro.fromJson(json['astro'] as Map<String, dynamic>),
        hour: json['hour'] == null
            ? [Hour.fromJson(<String, dynamic>{})]
            : (json['hour'] as List<dynamic>?)
                ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date_epoch': dateEpoch,
        'day': day?.toJson(),
        'astro': astro?.toJson(),
        'hour': hour?.map((e) => e.toJson()).toList(),
      };
}
