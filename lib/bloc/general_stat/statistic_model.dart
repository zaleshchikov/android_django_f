class StatisticModel{

  String generalURL;
  String GeneralHTML;
  String professionURL;
  String professionHTML;

  StatisticModel(this.generalURL, this.GeneralHTML, this.professionURL,
      this.professionHTML);

  factory StatisticModel.fromJson(Map<String, dynamic> json) {
    return StatisticModel(
      json['image_all'] as String,
      json['table_all'] as String,
      json['image_profession'] as String,
      json['table_profession'] as String,
    );
  }
}