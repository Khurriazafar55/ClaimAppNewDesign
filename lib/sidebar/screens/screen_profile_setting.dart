import 'dart:io';

import 'package:claim_core/sidebar/widgets/widget_profile.dart';
import 'package:claim_core/sidebar/widgets/widget_textField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenProfileSetting extends StatefulWidget {
  const ScreenProfileSetting({Key? key}) : super(key: key);

  @override
  State<ScreenProfileSetting> createState() => _ScreenProfileSettingState();
}

class _ScreenProfileSettingState extends State<ScreenProfileSetting> {
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var inspectorIdController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var positionController = TextEditingController();
  var companyController = TextEditingController();
  var companyPhoneController = TextEditingController();
  var companyEmailController = TextEditingController();

  var cAddressController = TextEditingController();
  var cCityController = TextEditingController();
  var cStateController = TextEditingController();
  var cZipController = TextEditingController();
  var dobController = TextEditingController();
  var xactIdController = TextEditingController();
  var xactAddressController = TextEditingController();

  var storiesController = TextEditingController();
  var pitchController = TextEditingController();
  var haagController = TextEditingController();

  var sunController = TextEditingController();
  var monController = TextEditingController();
  var tuesController = TextEditingController();
  var wedController = TextEditingController();
  var thursController = TextEditingController();
  var friController = TextEditingController();
  var satController = TextEditingController();

  var hailController = TextEditingController();
  var fireController = TextEditingController();
  var floodController = TextEditingController();
  var waterController = TextEditingController();
  var windController = TextEditingController();
  var commercialController = TextEditingController();
  var vandalismController = TextEditingController();
  var theftController = TextEditingController();
  var structuralController = TextEditingController();

  var descriptionController = TextEditingController();

  bool hailValue = false;
  bool fireValue = false;
  bool floodValue = false;
  bool waterValue = false;
  bool windValue = false;
  bool commercialValue = false;
  bool vandalismValue = false;
  bool theftValue = false;
  bool structuralValue = false;

  List<String> selectedNames = [];

  File? _img1;
  File? _image;
  final picker = ImagePicker();

  Widget checkExperience(String title, bool values) {
    return Row(
      children: [
        Checkbox(
          value: values,
          onChanged: (bool? value) {
            setState(() {
              values = value!;
            });
          },
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Future getImage1fromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _img1 = File(pickedImage.path);
      } else {
        print(" No Image Selected");
      }
    });
  }

  Future getImage1fromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _img1 = File(pickedImage.path);
      } else {
        print(" No Image Selected");
      }
    });
  }

  Future getImagefromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print(" No Image Selected");
      }
    });
  }

  Future getImagefromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print(" No Image Selected");
      }
    });
  }

  List<ZipCodes> _zipCodeList = [
    ZipCodes('60412', false),
    ZipCodes('60489', false),
    ZipCodes('60442', false),
    ZipCodes('60475', false),
  ];

  List<Widget> zipCodeChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _zipCodeList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(_zipCodeList[i].zipCode),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.grey,
          selected: _zipCodeList[i].isSelected,
          selectedColor: Colors.cyan,
          onSelected: (bool value) {
            setState(() {
              _zipCodeList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Setting",
              style: TextStyle(fontSize: 21, color: Colors.black87),
            ),
            Divider(
              endIndent: 20,
              indent: 30,
              thickness: 1,
            ),
            Text(
              "Profile",
              style: TextStyle(fontSize: 19, color: Colors.black87),
            ),
          ],
        ),
        actions: [SizedBox(width: 40)],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: 'assets/images/profile.jpg',
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'First Name',
                  controller: fNameController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Last Name',
                  controller: lNameController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Inspector ID',
                  controller: inspectorIdController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Phone Number',
                  controller: phoneController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            controller: emailController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Position',
            controller: positionController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Company',
            controller: companyController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Company Phone Number',
            controller: companyPhoneController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Company Email',
            controller: companyEmailController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          const Text(
            'ADDITIONAL INFORMATION ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Current Address',
            controller: cAddressController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Current City',
            controller: cCityController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Current State',
            controller: cStateController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Current Zip Code',
            controller: cZipController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Date of Birth',
            controller: dobController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'XactWare ID',
            controller: xactIdController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'XactNet Address',
            controller: xactAddressController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          const Text(
            'PREFERENCES ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Stories',
                  controller: storiesController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Pitch',
                  controller: pitchController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'HAAG Certified',
                  controller: haagController,
                  onChanged: (email) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Container()),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'AVAILABILITY ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Sunday',
                  controller: sunController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Monday',
                  controller: monController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Tuesday',
                  controller: tuesController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Wednesday',
                  controller: wedController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Thursday',
                  controller: thursController,
                  onChanged: (name) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFieldWidget(
                  label: 'Friday',
                  controller: friController,
                  onChanged: (name) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: 'Saturday',
                  controller: satController,
                  onChanged: (email) {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Container()),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'EXPERIENCE ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // direction: Axis.horizontal,
            children: [
              checkExperience('Hail Claims', hailValue),
              checkExperience('Fire Claims', fireValue),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkExperience('Flood Claims', floodValue),
              // SizedBox(
              //   width: 10,
              // ),
              checkExperience('Water Cliaims', waterValue),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkExperience('Wind Claims', windValue),
              SizedBox(
                width: 10,
              ),
              checkExperience('Commercial Cliaims', commercialValue),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkExperience('Vandalism Claims', vandalismValue),
              SizedBox(
                width: 10,
              ),
              checkExperience('Theft Cliaims', theftValue),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkExperience('Structural Claims', structuralValue),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Flood Claims',
          //         controller: floodController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Water Claims',
          //         controller: waterController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Wind Claims',
          //         controller: windController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Commercial Claims',
          //         controller: commercialController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Vandalism Claims',
          //         controller: vandalismController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Theft Claims',
          //         controller: theftController,
          //         onChanged: (name) {},
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFieldWidget(
          //         label: 'Structural Claims',
          //         controller: structuralController,
          //         onChanged: (email) {},
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(child: Container()),
          //   ],
          // ),
          // const SizedBox(height: 24),
          const Text(
            'EMPLOYED ZIP CODES ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            direction: Axis.horizontal,
            children: zipCodeChips(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Other Relevant Experience ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'DESCRIPTION',
            controller: descriptionController,
            maxLines: 5,
            onChanged: (about) {},
          ),
          const SizedBox(height: 24),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'ATTACHMENTS ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Resume Document.png ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.camera_alt),
                              title: new Text('Capture Photo'),
                              onTap: () {
                                getImage1fromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Gallery'),
                              onTap: () {
                                getImage1fromGallery();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });

                // Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 200,
                // decoration: BoxDecoration(
                //   border: Border.all(width: 3, color: Colors.black),
                // ),
                child: _img1 == null
                    ?
                    //  DottedBorder(
                    //     color: Colors.grey, //color of dotted/dash line
                    //     strokeWidth: 1, //thickness of dash/dots
                    //     dashPattern: [5, 5],
                    //     child: Center(child: Icon(Icons.library_add_outlined)),
                    //   )
                    SizedBox()
                    : Image.file(
                        _img1!,
                        fit: BoxFit.contain,
                        // width: 1000,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Adjuster Document.png ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.camera_alt),
                              title: new Text('Capture Photo'),
                              onTap: () {
                                getImagefromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Gallery'),
                              onTap: () {
                                getImagefromGallery();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });

                // Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 200,
                // decoration: BoxDecoration(
                //   border: Border.all(width: 3, color: Colors.black),
                // ),
                child: _image == null
                    ?
                    //  DottedBorder(
                    //     color: Colors.grey, //color of dotted/dash line
                    //     strokeWidth: 1, //thickness of dash/dots
                    //     dashPattern: [5, 5],
                    //     child: Center(child: Icon(Icons.library_add_outlined)),
                    //   )
                    SizedBox()
                    : Image.file(
                        _image!,
                        fit: BoxFit.contain,
                        // width: 1000,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZipCodes {
  String zipCode;
  bool isSelected;

  ZipCodes(this.zipCode, this.isSelected);
}
