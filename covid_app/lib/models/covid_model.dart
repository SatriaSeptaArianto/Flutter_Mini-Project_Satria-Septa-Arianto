class CovidModel{
  final int totalConfirmed;
  final int newConfirmed;
  final int totalTreated;
  final int newTreated;
  final int totalRecovered;
  final int newRecovered;
  final int totalDeaths;
  final int newDeaths;
  final DateTime date;

 CovidModel(
  this.totalConfirmed,
  this.totalTreated, 
  this.totalRecovered, 
  this.totalDeaths,
  this.newConfirmed,
  this.newTreated,
  this.newRecovered,
  this.newDeaths,
  this.date,    
);

  factory CovidModel.fromJson(Map<String, dynamic> json){
    return CovidModel(
      json["update"]["total"]["jumlah_positif"],
      json["update"]["total"]["jumlah_dirawat"],
      json["update"]["total"]["jumlah_sembuh"],
      json["update"]["total"]["jumlah_meninggal"],
      json["update"]["penambahan"]["jumlah_positif"],
      json["update"]["penambahan"]["jumlah_dirawat"],
      json["update"]["penambahan"]["jumlah_sembuh"],
      json["update"]["penambahan"]["jumlah_meninggal"],
      DateTime.parse(json["update"]["penambahan"]["tanggal"]),
    );
  }
}