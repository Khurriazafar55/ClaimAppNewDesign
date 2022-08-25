// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactClaims extends StatefulWidget {
  // static const routeName = "/contact";
  final DataSingleClaim? claim;
  final String claimId;
  final TabController controller;
  const ContactClaims({
    Key? key,
    this.claim,
    required this.claimId,
    required this.controller,
  }) : super(key: key);

  @override
  State<ContactClaims> createState() => _ContactClaimsState();
}

class _ContactClaimsState extends State<ContactClaims> {
  Future<ModelGetClaim>? future_get_claim;

  String login_token = "";

  Future<void>? _launched;
  final String _phone = '';

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   ConstantFunctions.getSharePrefModeString("login_token").then(
  //     (loginToken) {
  //       print("object : login_token : $loginToken");
  //       login_token = loginToken;
  //       setState(() {
  //         future_get_claim = ServiceClaim.GetClaimFunction(context, loginToken);
  //       });
  //     },
  //   );
  // }

  Future<void> _makePhoneCall(String phoneNumb) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumb,
    );
    await launchUrl(launchUri);
  }

  Future<void> _openMessageApp(String messageNumber) async {
    final Uri launchUri = Uri(scheme: 'sms', path: messageNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Container(
          decoration: const BoxDecoration(
              // color: ThemeColors.background_color,
              // borderRadius: BorderRadius.circular(20),
              ),
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    // color: ThemeColors.background_color,
                    // borderRadius: BorderRadius.circular(20),
                    ),
                // color: Colors.white,
                // height: 520,
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Container(
                      height: 190,
                      color: Colors.black,
                      // margin: EdgeInsets.only(left: 10, right: 10),
                    ),
                    myallclaims(
                      "${widget.claim!.carrierName}",
                      "${widget.claim!.mainContactPhoneNumber}",
                      "${widget.claim!.policyHolderName}",
                      "${widget.claim!.address}",
                      "${widget.claim!.policyHolderEmail}",
                      "${widget.claim!.policyHolderPhoneNumber}",
                      "${widget.claim!.adjusterName}",
                      "${widget.claim!.adjusterEmail}",
                      "${widget.claim!.adjusterPhoneNumber}",
                    ),
                    Container(
                      height: 30,
                    ),
                  ])),
                ),
              ),
            ],
          )),
    ]));
  }

  Widget UrlIcons(VoidCallback? onTap, icon) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(3),
          child: Icon(
            icon,
            color: Colors.orange,
            size: 27,
          ),
        ),
      ),
    );
  }

  Widget myallclaims(Contactname, Contactphone, policyName, policyAddress,
      policyEmail, policyPhone, AdjusterName, AdjusterEmail, AdjusterPhone) {
    // TextStyle style1 = TextStyle(
    //     color: Colors.black, fontSize: 14.5, fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle(
        color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold);

    TextStyle style3 = const TextStyle(
        color: Colors.black, fontSize: 15.5, fontWeight: FontWeight.bold);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'MainContact',
                            style: style3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            UrlIcons(() {
                              _launched = _openMessageApp(_phone);
                            }, Icons.message_rounded),
                            const SizedBox(
                              width: 15,
                            ),
                            UrlIcons(
                              () {
                                _launched = _makePhoneCall(_phone);

                                print('$_launched -----------------');
                              },
                              Icons.call,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Contactname,
                            style: style2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Contactphone,
                            style: style2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [],
                    ),
                  )
                ],
              ),
            ),
            //policy holder
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'PolicyHolder',
                            style: style3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            UrlIcons(
                              () {},
                              Icons.mail,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            UrlIcons(() {
                              _launched = _openMessageApp(_phone);
                            }, Icons.message),
                            const SizedBox(
                              width: 10,
                            ),
                            UrlIcons(
                              () {
                                _launched = _makePhoneCall(_phone);
                              },
                              Icons.call,
                            ),
                          ],
                        ),
                        Row()
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
              // color: Colors.pink,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            policyName,
                            style: style2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            policyAddress,
                            style: style2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  'Email:',
                                  style: style2,
                                ),
                                Text(
                                  policyEmail,
                                  style: style2,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  'Phone:',
                                  style: style2,
                                ),
                                Text(
                                  policyPhone,
                                  style: style2,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            UrlIcons(
                              () {},
                              Icons.directions,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            //  Adjuster
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Adjuster',
                            style: style3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            UrlIcons(
                              () {},
                              Icons.mail,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            UrlIcons(
                              () {
                                _launched = _openMessageApp(_phone);
                              },
                              Icons.message,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            UrlIcons(
                              () {
                                _launched = _makePhoneCall(_phone);
                              },
                              Icons.call,
                            ),
                          ],
                        ),
                        Row()
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
                child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AdjusterName,
                          style: style2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                'Email:',
                                style: style2,
                              ),
                              Text(
                                AdjusterEmail,
                                style: style2,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Phone:',
                                style: style2,
                              ),
                              Text(
                                AdjusterPhone,
                                style: style2,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            )),

            // color: Colors.pink,
          ],
        ),
      ),
    );
  }
}
