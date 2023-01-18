class GalleryModel {
  late int id;
  late String url;

  GalleryModel({
    required this.id,
    required this.url,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // url = json['url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}

// class GalleryModel {
//   int? id;
//   String? url;

//   GalleryModel({
//     this.id,
//     this.url,
  
//   });

//   GalleryModel.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson(){
//     return {
//       'id': id,
//       'url': url,
//     };
//   }

// }