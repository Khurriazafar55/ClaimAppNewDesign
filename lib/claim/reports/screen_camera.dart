import 'dart:io';

import 'package:camera/camera.dart';
import 'package:claim_core/app_theme_work/textformfield_theme.dart';

import 'package:claim_core/claim/models/model_get_report.dart';
import 'package:claim_core/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenCamera extends StatefulWidget {
  final ModelGetReport modelGetReport;

  ScreenCamera({required this.modelGetReport});

  @override
  _ScreenCameraState createState() => _ScreenCameraState();
}

class _ScreenCameraState extends State<ScreenCamera> {
  CameraController? _cameraController;

  //======== Dropdown data ==================================
  final dropdown_style = TextStyle(color: Colors.orange);
  final dropdown_padding = EdgeInsets.symmetric(horizontal: 5);
  double dropdown_height = 45;
  final dropdown_decoration = BoxDecoration(
      border: Border.all(color: Colors.orange, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(5)));

  List<DropdownMenuItem<String>> getDropdownMenuItem(
      {required List<String> room_dropdown}) {
    return room_dropdown.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.orange),
        ),
      );
    }).toList();
  }
  //======== Dropdown data ==================================

  String macro_dropdown_value = "";
  List<String> macro_dropdown = [
    'Macro 1',
    'Macro 2',
    'Macro 3',
    'Macro 4',
    'Macro 5',
    'Macro 6',
    'Macro 7',
  ];

  List<String> structure_dropdown = [
    "Add New Item",
    "Garage",
    "Fence",
    "Shed",
  ];
  String structure_dropdown_value = "";

  List<String> roof_material = [
    "Add New Item",
    "Shingles",
    "Vent",
    "Furnace Cap",
    "Drip Edge",
    "Metal",
    "Test Square",
    "Satellite Dish",
    "Chimney",
    "Ridge",
    "Ridge Vent",
    "Skylight",
    "Edge Metal",
    "AC Unit",
    "Flat Roof",
  ];

  List<String> elevation_material = [
    "Add New Item",
    "Siding",
    "Soffit",
    "Fascia",
    "Window",
    "Window Wrap",
    "AC Unit",
    "Paint",
    "Gutter",
    "DownSpout",
    "Door",
    "Shutters",
    "Garage Door",
    "Shingle",
    "Light",
    "Window Well",
    "Trim",
  ];

  List<String> interior_material = [
    "Add New Item",
    "Drywall",
    "Paint",
    "Trim",
    "Window",
    "Cabinet",
    "Countertop",
    "Carpet",
    "Flooring",
    "Tile",
    "Vinyl",
  ];

  List<String> R_E_I_material_dropdown = [];
  String R_E_I_material_dropdown_value = "";

  List<String> room_dropdown = [
    "Add New Item",
    "Bedroom 1",
    "Bedroom 2",
    "Bedroom 3",
    "Bedroom 4",
    "Bathroom",
    "Master Bedroom",
    "Master Bathroom",
    "Hallway",
    "Foyer",
    "Living Room",
    "Dining Room",
    "Basement",
    "Family Room",
    "Office",
    "TV Room",
    "Closet",
  ];
  String room_dropdown_value = "";

  List<String> damage_dropdown = [
    "Add New Item",
    "Damage",
    "Hail Damage",
    "Wind Damage",
    "Water Damage",
    "Tree Damage",
    "Fire Damage",
    "Smoke Damage",
    "Mechanical Damage",
    "Maintenance Issues",
  ];
  String damage_dropdown_value = "";

  //================================================

  String full_details = "";
  List<String> full_details_list = [];
  void GetFullDetailsText() {
    List<String> ddddd = [];
    String first = "$structure ,";
    String second = "$R_E_I_material_dropdown_value ,";
    String third = "$damage_dropdown_value ,";
    String forth = "$owner_name ,";
    String fifth = structure != "Interior" ? "$bottom_four_pole ," : "";
    String sixth = structure == "Interior" ? "$room_dropdown_value ," : "";
    String seventh = "$structure_dropdown_value ,";
    String eight = "$celling_wall_floor_option ,";
    String ninth = is_material ? "Material ," : "";
    String tenth = "$damage_type ,";
    String elevanth = "$macro_dropdown_value ,";
    String twilth = overview_close != "" ? "$overview_close ," : "";
    String thirteen = "$room_dropdown_value ,";
    // TODO Sifat
    ddddd.add(first);
    ddddd.add(second);
    ddddd.add(third);
    ddddd.add(forth);
    fifth != "" ? ddddd.add(fifth) : null;
    sixth != "" ? ddddd.add(sixth) : null;
    ddddd.add(seventh);
    ddddd.add(eight);
    ninth != "" ? ddddd.add(ninth) : null;
    ddddd.add(tenth);
    ddddd.add(elevanth);
    ddddd.add(thirteen);
    twilth != "" ? ddddd.add(twilth) : null;

    print("dddddddddd : ${ddddd}");
    full_details_list = ddddd;
    full_details =
        "$first $second $third $forth $fifth $sixth $seventh $eight $ninth $tenth $elevanth $twilth $thirteen";
  }

  //================================================

  String structure = "Interior"; // 1
  String celling_wall_floor_option = "Celling";
  String overview_close = "";
  bool iscamerafront = false;

  String damage_type = "Damage";
  bool is_material = false;
  String bottom_four_pole = "NORTH";
  String owner_name = "";
  bool is_flash = false;

  bool is_camera_initionalize = false;

  final textstyle =
      TextStyle(fontSize: 14, letterSpacing: 0, fontWeight: FontWeight.w600);

  final charector_text_style =
      TextStyle(fontWeight: FontWeight.w600, color: Colors.orange);

  @override
  void initState() {
    super.initState();

    setState(() {
      damage_type = "Damage";
      R_E_I_material_dropdown = interior_material;
      R_E_I_material_dropdown_value = "${R_E_I_material_dropdown[1]}";
      room_dropdown_value = "${room_dropdown[1]}";
      damage_dropdown_value = damage_dropdown[1];
      structure_dropdown_value = structure_dropdown[1];
      macro_dropdown_value = macro_dropdown[0];
      owner_name = widget.modelGetReport.data!.claim!.adjusterName!;

      GetFullDetailsText();
    });

    try {
      _cameraController = CameraController(cameras![0], ResolutionPreset.high);
      cameraValue = _cameraController!.initialize().then(
        (_) {
          if (!mounted) {
            return;
          }
          setState(() {
            is_camera_initionalize = true;
            getLandscafe();
          });
        },
      );
    } catch (e) {
      setState(() {
        is_camera_initionalize = false;
        return;
      });
    }
  }

  Future<void>? cameraValue;

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!is_camera_initionalize) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(_cameraController!),
              ),
            ),

            //three button wall, celling, floor and back button

            Positioned(
              bottom: 80,
              // top: 50,
              left: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  structure == "Interior"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (celling_wall_floor_option == "Celling") {
                                    celling_wall_floor_option = "";
                                  } else {
                                    celling_wall_floor_option = "Celling";
                                  }
                                  GetFullDetailsText();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 9),
                                decoration: BoxDecoration(
                                  color: celling_wall_floor_option == "Celling"
                                      ? Colors.white
                                      : Colors.transparent,
                                  border: Border.all(
                                    color:
                                        celling_wall_floor_option == "Celling"
                                            ? Colors.white
                                            : Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: RotatedBox(
                                    quarterTurns: 0,
                                    child: Text(
                                      'C',
                                      style: charector_text_style,
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (celling_wall_floor_option == "Wall") {
                                    celling_wall_floor_option = "";
                                  } else {
                                    celling_wall_floor_option = "Wall";
                                  }
                                  GetFullDetailsText();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 9),
                                decoration: BoxDecoration(
                                    color: celling_wall_floor_option == "Wall"
                                        ? Colors.white
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: celling_wall_floor_option == "Wall"
                                          ? Colors.transparent
                                          : Colors.orange,
                                      width: 2,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: RotatedBox(
                                    quarterTurns: 0,
                                    child: Text(
                                      'W',
                                      style: charector_text_style,
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (celling_wall_floor_option == "Floor") {
                                    celling_wall_floor_option = "";
                                  } else {
                                    celling_wall_floor_option = "Floor";
                                  }
                                  GetFullDetailsText();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 9),
                                decoration: BoxDecoration(
                                    color: celling_wall_floor_option == "Floor"
                                        ? Colors.white
                                        : Colors.transparent,
                                    border: Border.all(
                                      color:
                                          celling_wall_floor_option == "Floor"
                                              ? Colors.transparent
                                              : Colors.orange,
                                      width: 2,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: RotatedBox(
                                    quarterTurns: 0,
                                    child: Text(
                                      'F',
                                      style: charector_text_style,
                                    )),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),

            //North South East West pole buttons
            Positioned(
              top: 15,
              right: 10,
              child: structure != "Interior"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        bottom_four_pole = "top_left";
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: bottom_four_pole == "top_left"
                                            ? Colors.orange
                                            : Colors.transparent,
                                        border: Border.all(
                                            color:
                                                bottom_four_pole == "top_left"
                                                    ? Colors.orange
                                                    : Colors.orange,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: RotatedBox(
                                      quarterTurns: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(7),
                                        child: Text(
                                          "F",
                                          style: charector_text_style.copyWith(
                                              color:
                                                  bottom_four_pole == "top_left"
                                                      ? Colors.black
                                                      : Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        bottom_four_pole = "bottom_left";
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: bottom_four_pole == "bottom_left"
                                            ? Colors.orange
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: bottom_four_pole ==
                                                    "bottom_left"
                                                ? Colors.orange
                                                : Colors.orange,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: RotatedBox(
                                      quarterTurns: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(7),
                                        child: Text(
                                          "B",
                                          style: charector_text_style.copyWith(
                                              color: bottom_four_pole ==
                                                      "bottom_left"
                                                  ? Colors.black
                                                  : Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        bottom_four_pole = "top_right";
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: bottom_four_pole == "top_right"
                                            ? Colors.orange
                                            : Colors.transparent,
                                        border: Border.all(
                                            color:
                                                bottom_four_pole == "top_right"
                                                    ? Colors.orange
                                                    : Colors.orange,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: RotatedBox(
                                      quarterTurns: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(7),
                                        child: Text(
                                          "R",
                                          style: charector_text_style.copyWith(
                                              color: bottom_four_pole ==
                                                      "top_right"
                                                  ? Colors.black
                                                  : Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        bottom_four_pole = "bottom_right";
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            bottom_four_pole == "bottom_right"
                                                ? Colors.orange
                                                : Colors.transparent,
                                        border: Border.all(
                                            color: bottom_four_pole ==
                                                    "bottom_right"
                                                ? Colors.orange
                                                : Colors.orange,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: RotatedBox(
                                      quarterTurns: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(7),
                                        child: Text(
                                          "L",
                                          style: charector_text_style.copyWith(
                                              color: bottom_four_pole ==
                                                      "bottom_right"
                                                  ? Colors.black
                                                  : Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(
                      padding: dropdown_padding,
                      height: dropdown_height,
                      width: 135,
                      decoration: dropdown_decoration,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        focusColor: Colors.blue,
                        underline: SizedBox(),
                        value: room_dropdown_value,
                        style: dropdown_style,
                        iconEnabledColor: Colors.orange,
                        items:
                            getDropdownMenuItem(room_dropdown: room_dropdown),
                        onChanged: (String? value) {
                          setState(() {
                            if (value == "Add New Item") {
                              GetAddItemFunction(room_dropdown, false);
                              // ConstantFunctions.getSnakeBar(
                              //     context, "New Item will be added");
                            } else {
                              room_dropdown_value = value!;
                            }
                            GetFullDetailsText();
                          });
                        },
                      ),
                    ),
              //TODO Sifat
            ),

            // Front back camera button, click image button, Overview and closeup button
            Positioned(
              bottom: 0,
              top: 10,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        is_flash = !is_flash;
                      });
                      is_flash
                          ? _cameraController!.setFlashMode(FlashMode.torch)
                          : _cameraController!.setFlashMode(FlashMode.off);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: Icon(
                          is_flash ? Icons.flash_on : Icons.flash_off,
                          color: is_flash ? Colors.white : Colors.orange,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () => takePhoto(context, structure, owner_name,
                        overview_close, damage_type),
                    child: Icon(
                      Icons.radio_button_checked_rounded,
                      color: Colors.orangeAccent,
                      size: 80,
                    ),
                  ),
                  SizedBox(width: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (overview_close == "over_view") {
                              overview_close = "";
                            } else {
                              overview_close = "over_view";
                            }
                            GetFullDetailsText();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 9),
                          decoration: BoxDecoration(
                              color: overview_close == "over_view"
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(
                                color: overview_close == "over_view"
                                    ? Colors.white
                                    : Colors.orange,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: RotatedBox(
                              quarterTurns: 0,
                              child: Text(
                                'O',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (overview_close == "close_up") {
                              overview_close = "";
                            } else {
                              overview_close = "close_up";
                            }
                            GetFullDetailsText();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 9),
                          decoration: BoxDecoration(
                              color: overview_close == "close_up"
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(
                                color: overview_close == "close_up"
                                    ? Colors.white
                                    : Colors.orange,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: RotatedBox(
                              quarterTurns: 0,
                              child: Text(
                                'C',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),

            //font slop overview and 4 buttons
            Positioned(
              bottom: 15,
              left: 100,
              right: 100,
              // top: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //TODO Sifat
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              // width: 70,
                              // height: 12,
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,

                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                // width: MediaQuery.of(context).size.width - 80,
                                width: 200,
                                // height: MediaQuery.of(context).size.width - 100,
                                height: 250,
                                decoration: new BoxDecoration(
                                  color: Colors
                                      .white, //Colors.black.withOpacity(0.3),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: const Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: full_details_list.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            full_details_list[index],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 24.0),
                                    ElevatedButton.icon(
                                      onPressed: () => Navigator.pop(context),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      label: Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      //TODO Sifat
                      child: RotatedBox(
                        quarterTurns: 0,
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            "$full_details",
                            overflow: TextOverflow.ellipsis,
                            style: textstyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              is_material = !is_material;
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: is_material
                                  ? Colors.orange
                                  : Colors.transparent,
                              border: Border.all(
                                  color: is_material
                                      ? Colors.orange
                                      : Colors.orange,
                                  width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: RotatedBox(
                            quarterTurns: 0,
                            child: Container(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                "Material",
                                style: textstyle.copyWith(
                                    color: is_material
                                        ? Colors.black
                                        : Colors.orange),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (damage_type == "Damage") {
                                    damage_type = "";
                                  } else {
                                    damage_type = "Damage";
                                  }
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: damage_type == "Damage"
                                      ? Colors.orange
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: damage_type == "Damage"
                                          ? Colors.orange
                                          : Colors.orange,
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: RotatedBox(
                                quarterTurns: 0,
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    "   Damage   ",
                                    style: textstyle.copyWith(
                                        color: damage_type == "Damage"
                                            ? Colors.black
                                            : Colors.orange),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (damage_type == "No Damage") {
                                    damage_type = "";
                                  } else {
                                    damage_type = "No Damage";
                                  }
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: damage_type == "No Damage"
                                      ? Colors.orange
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: damage_type == "No Damage"
                                          ? Colors.orange
                                          : Colors.orange,
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: RotatedBox(
                                quarterTurns: 0,
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    "No Damage",
                                    style: textstyle.copyWith(
                                        color: damage_type != "No Damage"
                                            ? Colors.orange
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: dropdown_padding,
                        height: dropdown_height,
                        width: 92,
                        decoration: dropdown_decoration,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          focusColor: Colors.blue,
                          underline: SizedBox(),
                          value: macro_dropdown_value,
                          //elevation: 5,
                          isExpanded: true,
                          style: dropdown_style,
                          iconEnabledColor: Colors.orange,
                          items: getDropdownMenuItem(
                              room_dropdown: macro_dropdown),
                          onChanged: (String? value) {
                            setState(() {
                              macro_dropdown_value = value!;
                              GetFullDetailsText();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //two texts and and one name textform field
            Positioned(
              top: 20,
              left: 150,
              right: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: dropdown_padding,
                        height: dropdown_height,
                        width: 131,
                        decoration: dropdown_decoration,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          focusColor: Colors.blue,
                          underline: SizedBox(),
                          value: R_E_I_material_dropdown_value,
                          style: dropdown_style,
                          isExpanded: true,
                          iconEnabledColor: Colors.orange,
                          items: getDropdownMenuItem(
                              room_dropdown: R_E_I_material_dropdown),
                          onChanged: (String? value) {
                            setState(() {
                              if (value == "Add New Item") {
                                GetAddItemFunction(
                                    R_E_I_material_dropdown, true);
                                // ConstantFunctions.getSnakeBar(
                                //     context, "New Item will be added");
                              } else {
                                R_E_I_material_dropdown_value = value!;
                              }
                              GetFullDetailsText();
                            });
                          },
                        ),
                      ),

                      SizedBox(width: 5),
                      // Damage Drop Down
                      Container(
                        padding: dropdown_padding,
                        height: dropdown_height,
                        width: 131,
                        decoration: dropdown_decoration,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          focusColor: Colors.blue,
                          underline: SizedBox(),
                          value: damage_dropdown_value,
                          style: dropdown_style,
                          isExpanded: true,
                          iconEnabledColor: Colors.orange,
                          items: getDropdownMenuItem(
                              room_dropdown: damage_dropdown),
                          onChanged: (String? value) {
                            setState(() {
                              if (value == "Add New Item") {
                                GetAddItemFunction(damage_dropdown, false);
                                // ConstantFunctions.getSnakeBar(
                                //     context, "New Item will be added");
                              } else {
                                damage_dropdown_value = value!;
                              }
                              GetFullDetailsText();
                            });
                          },
                        ),
                      ),

                      // RotatedBox(
                      //   quarterTurns: 0,
                      //   child: Container(
                      //     padding: EdgeInsets.all(7),
                      //     child: Text(
                      //       "Material",
                      //       style: charector_text_style,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          width: 140,
                          height: 35,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(owner_name, style: charector_text_style),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Structure roof and elevation buttons
            Positioned(
              top: 25,
              bottom: 10,
              left: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // padding: EdgeInsets.only(right: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (structure == "Roof") {
                                    structure = "Interior";
                                    R_E_I_material_dropdown =
                                        elevation_material;
                                    R_E_I_material_dropdown_value =
                                        R_E_I_material_dropdown[1];
                                  } else {
                                    structure = "Roof";
                                    R_E_I_material_dropdown = roof_material;
                                    R_E_I_material_dropdown_value =
                                        R_E_I_material_dropdown[1];
                                  }
                                  GetFullDetailsText();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 9),
                                decoration: BoxDecoration(
                                  color: structure == "Roof"
                                      ? Colors.white
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: structure == "Roof"
                                        ? Colors.white
                                        : Colors.orange,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: RotatedBox(
                                    quarterTurns: 0,
                                    child: Text(
                                      'R',
                                      style: charector_text_style,
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (structure == "Elevation") {
                                    structure = "Interior";
                                    R_E_I_material_dropdown = interior_material;
                                    R_E_I_material_dropdown_value =
                                        R_E_I_material_dropdown[1];
                                  } else {
                                    structure = "Elevation";
                                    R_E_I_material_dropdown =
                                        elevation_material;
                                    R_E_I_material_dropdown_value =
                                        R_E_I_material_dropdown[1];
                                  }
                                  GetFullDetailsText();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 9),
                                decoration: BoxDecoration(
                                    color: structure == "Elevation"
                                        ? Colors.white
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: structure == "Elevation"
                                          ? Colors.transparent
                                          : Colors.orange,
                                      width: 2,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: RotatedBox(
                                    quarterTurns: 0,
                                    child: Text(
                                      'E',
                                      style: charector_text_style,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: dropdown_padding,
                          height: dropdown_height,
                          width: 131,
                          decoration: dropdown_decoration,
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            focusColor: Colors.blue,
                            underline: SizedBox(),
                            value: structure_dropdown_value,
                            style: dropdown_style,
                            iconEnabledColor: Colors.orange,
                            items: getDropdownMenuItem(
                                room_dropdown: structure_dropdown),
                            onChanged: (String? value) {
                              setState(() {
                                if (value == "Add New Item") {
                                  GetAddItemFunction(structure_dropdown, false);
                                  // ConstantFunctions.getSnakeBar(
                                  //     context, "New Item will be added");
                                } else {
                                  structure_dropdown_value = value!;
                                }
                                GetFullDetailsText();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(
                      Icons.perm_media,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void takePhoto(BuildContext context, structure, owner_name, is_over_view,
      material_3_option) async {
    XFile file = await _cameraController!.takePicture();

    final file2 = File(file.path); //your file path

    String fdfdfd01 =
        "${celling_wall_floor_option}-${DateTime.now().toString()}.jpg";
    String fdfdfd02 = "${bottom_four_pole}-${DateTime.now().toString()}.jpg";
    File file_name;
    if (structure == "Interior") {
      file_name = await changeFileNameOnly(File(file.path), "${fdfdfd01}");
      print("filefile : file name 01 : ${file_name.path}");
    } else {
      file_name = await changeFileNameOnly(File(file.path), "${fdfdfd02}");
      print("filefile : file name 02 : ${file_name.path}");
    }

    // String celling_wall_floor_option = "Celling";
    // String structure = "Interior";
    // bool is_over_view = false;

    // String material_3_option = "Material";
    // String bottom_four_pole = "North";
    // String owner_name = "";
    // bool front_slope_overview = true;
    // bool is_macro = false;
    // bool is_flash = false;

    // 1. Damage_type       => material, damage, no damage
    // 2. Image_name
    // 3. Image_format      => Overview closeup
    // 4. structure_type  material_3_option   => (Roof/ Elevation/ Interior)
    // 5. room_type         => (C/W/F)
    // 8. Image_taken_side (North/West/South/East)
    // 9. Macro
    // 10. Image_path
    // 11. claimId
    // 11. reportId

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ShowImage(
          file_name: file_name,
          material_3_option: material_3_option,
          modelGetReport: widget.modelGetReport,
          is_over_view: is_over_view,
          structure: structure,
          celling_wall_floor_option: celling_wall_floor_option,
          bottom_four_pole: bottom_four_pole,
        ),
      ),
    );

    getLandscafe();
    //
    //         // https://insurancefapp.azurewebsites.net/Services//api/claim/GetAll
    //       ),
    //     ),
    //   ),
    // );
  }

  void getLandscafe() {
    setState(() {
      if (Platform.isIOS) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
        ]);
      }
    });
  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

  void GetAddItemFunction(dropdown_list, isMaterial) {
    TextEditingController txtEdtCntrlr1 = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 30),
                // width: MediaQuery.of(context).size.width - 80,
                width: 250,
                // height: MediaQuery.of(context).size.width - 100,
                height: 250,
                decoration: new BoxDecoration(
                  color: Colors.white, //Colors.black.withOpacity(0.3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextFormFieldTheme.GetTextFormFieldWithBorder(
                        context,
                        "Enter Item",
                        txtEdtCntrlr1,
                        "",
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (txtEdtCntrlr1.text.length > 0) {
                              if (isMaterial) {
                                if (structure == "Elevation") {
                                  elevation_material
                                      .add(txtEdtCntrlr1.text.toString());
                                } else if (structure == "Interior") {
                                  interior_material
                                      .add(txtEdtCntrlr1.text.toString());
                                } else if (structure == "Roof") {
                                  roof_material
                                      .add(txtEdtCntrlr1.text.toString());
                                }
                              } else {
                                dropdown_list
                                    .add(txtEdtCntrlr1.text.toString());
                              }
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ShowImage extends StatefulWidget {
  final File file_name;
  final material_3_option;
  final structure;
  final is_over_view;
  final celling_wall_floor_option;
  final bottom_four_pole;
  final ModelGetReport modelGetReport;

  ShowImage({
    required this.file_name,
    required this.material_3_option,
    required this.structure,
    required this.is_over_view,
    required this.celling_wall_floor_option,
    required this.bottom_four_pole,
    required this.modelGetReport,
  });

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 150),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                File(widget.file_name.path),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () {
                  // ConstantFunctions.getSharePrefModeString("login_token").then(
                  //   (login_token) {
                  //     RestApiUtils.ShowLoadingDialog(context);
                  //     ServiceClaim.UploadCameraImage(
                  //       context,
                  //       login_token,
                  //       Damage_type: "${widget.material_3_option}",
                  //       structure_type: "${widget.structure}",
                  //       Image_format:
                  //           widget.is_over_view ? "Overview" : "Closeup",
                  //       claimId: widget
                  //           .modelGetReport.data!.assignedClaim!.claimId
                  //           .toString(),
                  //       reportId: widget
                  //           .modelGetReport.data!.claimReportModel!.id
                  //           .toString(),
                  //       Macro: widget.is_macro ? "macro" : "",
                  //       Image_taken_side: widget.bottom_four_pole,
                  //       room_type: '${widget.three_option}',
                  //       Image_path: '${widget.file_name.path}',
                  //       Image_name: '$widget.file_name',
                  //       image_file: widget.file_name,
                  //     ).then((value) {
                  //       Navigator.pop(context);
                  //       if (value.dataCamera != null) {
                  //         ConstantFunctions.getSnakeBar(
                  //             context, "Picture is uploaded successfully");
                  //       } else {
                  //         ConstantFunctions.getSnakeBar(
                  //             context, value.message!);
                  //       }
                  //     });
                  //   },
                  // );
                },
                child: Icon(
                  Icons.upload,
                  color: Colors.blue,
                  size: 34,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.save,
                  color: Colors.blue,
                  size: 34,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
