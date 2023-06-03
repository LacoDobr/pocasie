import 'condition.dart';

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalsnowCm;
  double? avgvisKm;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalsnowCm,
    this.avgvisKm,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
        maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
        totalsnowCm: (json['totalsnow_cm'] as num?)?.toDouble(),
        avgvisKm: (json['avgvis_km'] as num?)?.toDouble(),
        avghumidity: (json['avghumidity'] as num?)?.toDouble(),
        dailyWillItRain: json['daily_will_it_rain'] as int?,
        dailyChanceOfRain: json['daily_chance_of_rain'] as int?,
        dailyWillItSnow: json['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: json['daily_chance_of_snow'] as int?,
        condition: json['condition'] == null
            ? Condition.fromJson(<String, dynamic>{})
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: (json['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'mintemp_c': mintempC,
        'avgtemp_c': avgtempC,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}
