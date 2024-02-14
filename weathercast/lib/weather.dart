class Weather {
//eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJhYjZmZDUzNzNkMzkyZTIyZDY3NzUxZmVkMWI0ZGJkYzEzNzk1Y2NhODc2YzlmYzJiNTk1ZWFlNDY5OTFiMDBlMzkyODlkODQwM2IzZjc2In0.eyJhdWQiOiIyIiwianRpIjoiYmFiNmZkNTM3M2QzOTJlMjJkNjc3NTFmZWQxYjRkYmRjMTM3OTVjY2E4NzZjOWZjMmI1OTVlYWU0Njk5MWIwMGUzOTI4OWQ4NDAzYjNmNzYiLCJpYXQiOjE3MDc4ODIyMjYsIm5iZiI6MTcwNzg4MjIyNiwiZXhwIjoxNzM5NTA0NjI2LCJzdWIiOiIzMDA0Iiwic2NvcGVzIjpbXX0.huo3WfFao2_VgThcH4czSzDFOkbJ-SrhGvQK2fRBuoOENVLZ33LsL6EvW5MBSY-adSxlLKXjS3yPu5YCDPHfh3GUp4RjZE4WmWE9UrsKchOhy2agqZzyuuliljB_FKETbiLN3hba9UC08IFmOUiTTsmEIEakzvMIG8WbySmP2xiPTDzLCYrdCniAdNQOTqCEzGwdeQ4pMD7ZDuvdx71le8dtthBWm8Cs0-jl95rbquQPIQNMMZ1l9WukvHa8VLf70BjYGl6eRDwJAMJ-yDbb2ZCXpwzQHC8_SBBmy-GwctNrOLaob6aOitMKB1G9_fVlinysZnKhfW7GA0AYYoNFi3OSjwIkWdgoGFBVH7qdsIAp4Il9Ytjt6NissSsyag64v5nADDsJzNRt35JqhgoCGKFiInkdiNEJdfQRApu_Y-iF5vUPtsUQf0XYsWvuuHZTFutU-BihRCockgJzODzQPzhF3AJKkCwZmFxUFO7BKLGf-b_gAur3xhWCkuyoIg-sXko-6QEutASpr_G1iuBZmU4JDCDQEHdD7EeTr5HHLS1TSJzsPMowGYP790P2tGZkrjC4Bl3QKbLqnleCS3nYX4YQFO9HoiMhUWlBtRcCrGM0DAApND7vbtEnzID4edmETRjnBELJL0dJZncOX2QxCgPTiygyhwk3CmxnfGecAc4
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];

  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];

  final String address;
  final double temperature;
  final int cond;

  Weather(
      {required this.address, required this.temperature, required this.cond});

  String get condition => _condition[cond];

  String get symbol => _symbol[cond];

  String get body => address;
}
