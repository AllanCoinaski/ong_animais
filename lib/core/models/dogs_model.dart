///Modelo de dados do Cachorro
class DogsModel {
  List<Breeds>? breeds;
  String? id;
  String? url;
  int? width;
  int? height;

  DogsModel({this.breeds, this.id, this.url, this.width, this.height});

  DogsModel.fromJson(Map<String, dynamic> json) {
    if (json['breeds'] != null) {
      breeds = <Breeds>[];
      json['breeds'].forEach((v) {
        breeds!.add(new Breeds.fromJson(v));
      });
    }
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Breeds {
  Weight? weight;
  Weight? height;
  int? id;
  String? name;
  String? countryCode;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? referenceImageId;

  Breeds(
      {this.weight,
      this.height,
      this.id,
      this.name,
      this.countryCode,
      this.bredFor,
      this.breedGroup,
      this.lifeSpan,
      this.temperament,
      this.referenceImageId});

  Breeds.fromJson(Map<String, dynamic> json) {
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Weight.fromJson(json['height']) : null;
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    referenceImageId = json['reference_image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['bred_for'] = this.bredFor;
    data['breed_group'] = this.breedGroup;
    data['life_span'] = this.lifeSpan;
    data['temperament'] = this.temperament;
    data['reference_image_id'] = this.referenceImageId;
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}
