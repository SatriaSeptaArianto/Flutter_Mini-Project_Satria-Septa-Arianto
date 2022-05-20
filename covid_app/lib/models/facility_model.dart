class FacilityModel{
  final String name;
  final String city;
  final String address;
  final String phone;
  final String facility;
  final String status;
  
  FacilityModel(
    this.name,
    this.city,
    this.address,
    this.phone,
    this.facility,
    this.status,
  );

  factory FacilityModel.fromJson(Map<String, dynamic> json){
    return FacilityModel(
      json["nama"]??'',
      json["kota"]??'',
      json["alamat"]??'',
      json["telp"]??'',
      json["jenis_faskes"]??'',
      json["status"]??'',
    );
  }
}
