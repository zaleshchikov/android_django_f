class Vacancy{
  String title;
  String description;
  String skills;
  String company;
  List salary;
  String area;
  DateTime publishedAt;

  Vacancy(this.title, this.description, this.skills, this.company, this.salary,
      this.area, this.publishedAt);

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      json['title'],
      json['description'],
      json['skills'],
      json['company'],
      json['salary'] == null ? [] : [json['salary']['from'],  json['salary']['to']],
      json['area'],
      DateTime.parse(json['published_at']),
    );
  }

}