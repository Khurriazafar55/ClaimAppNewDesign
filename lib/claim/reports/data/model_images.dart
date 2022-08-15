class ModelImages {
  int id;
  String claim_id;
  String image;
  String structure;
  String owner_name;
  String is_over_view;
  String material_4_option;
  String front_slop_overview;

  ModelImages({
    required this.id,
    required this.claim_id,
    required this.image,
    required this.structure,
    required this.owner_name,
    required this.is_over_view,
    required this.material_4_option,
    required this.front_slop_overview,
  });

  factory ModelImages.fromMap(Map<String, dynamic> json) => ModelImages(
        id: json["id"],
        claim_id: json["claim_id"],
        image: json["image"],
        structure: json["structure"],
        owner_name: json["owner_name"],
        is_over_view: json["is_over_view"],
        material_4_option: json["material_4_option"],
        front_slop_overview: json["front_slop_overview"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "claim_id": claim_id,
        "image": image,
        "structure": structure,
        "owner_name": owner_name,
        "is_over_view": is_over_view,
        "material_4_option": material_4_option,
        "front_slop_overview": front_slop_overview,
      };
}
