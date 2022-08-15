import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/sidebar/screens/CustomDialogBox.dart';
import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';
import '../widgets/widget_bottomnavbar.dart';

class PageReports extends StatelessWidget {
  PageReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ThemeColors.background_color,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                ShowDialog(context, "Roof Type", roof_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Roof Type", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                ShowDialog(context, "Roof Style", roof_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Roof Style", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Edge Metal", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Dwelling Metarial", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Dwelling Type", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Garage Material", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                ShowDialog(context, "Roof Style", roof_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Roof Summery", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                ShowDialog(context, "Roof Style", roof_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Roof Component", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                ShowDialog(context, "Elevation Summery", elevation_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Elevation Summery", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                ShowDialog(context, "Interior Summery", Interior_string);
              },
              child: GetMenuList(context, Icons.format_list_bulleted,
                  "Interior Summery", Colors.black87),
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 10,
            ),
            WidgetsReusing.GetTextButton(context, "Restore Default", null,
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ResusableBottomNavBar(),
          ],
        ),
      ),
    );
  }

  void ShowDialog(context, title, stringList) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: title,
            descriptions: stringList,
            text: "Save",
          );
        });
  }

  List<String> elevation_string = [
    "Start with a broad overview shot. If you can’t fit the entire elevation, take multiple overview shots.",
    "Look around for clear signs of damage. Make sure to take photos of anything that appears abnormal. Consider taking the photos from multiple angles if it helps. Don’t forget to take close-up shots of any damage you find",
    "Measure the downspouts, and take photos if they’re damaged.",
    "Check the windows. Are any of them scratched? Cracked? Broken? Letting in drafts? Don’t forget to check the immediately-surrounding areas as well.",
    "Examine the door(s). Is each door still making a good seal when shut? Is it damaged, or falling off the hinges? What about the screen doors - are they torn or derailed?",
    "Take pictures of all sides of the AC unit. Make sure it’s still in working condition.",
    "Examine the garage door(s). Is each door able to open and close properly?",
  ];

  List<String> roof_string = [
    "Look around for clear signs of damage. Make sure to take photos of anything that appears abnormal. Consider taking the photos from multiple angles if it helps. Don’t forget to take close-up shots of any damage you find.",
    "Check the shingles. What type of shingles are they? Can you determine how old they are? How many layers are there? Do they have an ice/water shield? What about felt, and if there is, what type? What condition are they in?",
    "Check for gutters or a drip edge. If either is present, take pictures. Take measurements and document them, and check for gutter guards.",
    "Make sure to get an accurate pitch measurement and document it.",
    "Make sure to measure the soffits and fascia, and document the measurements.",
    "If possible, get good overview photos of the roof. Take photos of the slopes as well.",
    "Count the vents and take pictures of them.",
    "Check for skylights. Are any of them scratched? Cracked? Broken? Letting in drafts? Don’t forget to check the immediately-surrounding areas as well.",
    "How many dormers are there, and have they been inspected?",
    "Check for flashing. What type is it, and what condition is it in? Is there any valley flashing?",
    "Take a photo of the chimney. What condition is it in?",
    "Check the rakes, and take pictures.",
    "Are there any other accessories to account for? Which ones? What condition?",
  ];

  List<String> Interior_string = [
    "Look around for clear signs of damage. Make sure to take photos of anything that appears abnormal. Consider taking the photos from multiple angles if it helps. Don’t forget to take close-up shots of any damage you find.",
    "Make sure you know the layout of the interior, so you can keep track of which rooms and hallways you’ve checked. It might be handy to make a list or diagram, and check them off as you go.",
    "Check any stairways. If it’s possible to access the underside of the stairs, inspect there too.",
    "Check each entrance and the rooms they lead into. Make sure to check the doors and windows on the interior side as well.",
    "Check every door, making sure it can close and latch properly.",
    "Check the walls, and make sure the paint isn’t peeling.",
    "Do the light switches and outlets work?",
    "Inspect and document any bedrooms. If a bedroom turns out to be hazardous, you have an obligation to inform the homeowner(s).",
    "Look in the kitchen. Are the appliances still functional? Are the cabinets in good condition? If there’s an exhaust fan, is it working?",
    "Inspect the attic. Check the insulation, as well as for any leaks or other signs of damage.",
    "Is there a basement? Is it finished? Have you inspected it?",
    "Are there any crawl spaces, and have they been inspected?",
    "Check for a sump pump. Is it in working order?",
    "Is the insulation in good condition?",
    "Check the smoke and carbon monoxide detectors. Are they still functional?",
    "Don’t forget to inspect and document the inside of the garage.",
  ];

  List<String> exterior_string = [
    "If there are detached structures, such as a detached garage or a barn, make sure to give them a full inspection as well.",
    "Is there a fence on the property? If so, make sure to inspect and document it. Make sure any fence gates can still close properly, and lock properly if applicable.",
    "Is there a shed?",
    "Is there a pool? If yes, check the cover, lining, filters/surface skimmers, pump equipment, heater (if there is one), and ground wire. Check for any leaks as well.",
    "Is there a gazebo?",
    "Is there a trampoline? Check to see if it’s torn or otherwise damaged.",
    "Check the mailbox. Make sure any doors on it close properly.",
    "Is there any outdoor furniture?",
    "While you’re checking around the property, look for any debris and document what you find.",
    "Is there a drainage system nearby? Is it obstructed or otherwise prevented from taking in water?",
  ];

  List<String> hail_and_wind_damage_string = [
    "Make sure to document and take photos of all possible damage spots. Make sure to get close-ups as well.",
    "Did you chalk all the damage? This includes gutters and downspouts.",
    "Were test squares drawn out? If so, did you document the wind and hail damage to them?",
    "Run a brittle test if necessary.",
    "Check for any leftover pieces of hail.",
  ];

  List<String> water_damage_string = [
    "Did you identify the source of the water (if applicable)?",
    "Are there any water marks or wet spots on the ceiling?",
    "Are any of the walls looking stained or discolored? Are the walls or floors warped?",
    "Check any carpets - are they still noticeably wet? What about furniture?",
    "Is any of the structure visibly starting to rot?",
    "Check for any remaining standing water, as well as leaks or other signs of uncontained water.",
  ];

  List<String> fire_and_smoke_damage_string = [
    "Watch out for leftover soot and ash.",
    "Is the structure of the property still intact? Be careful, as surfaces may be weakened, and could fall.",
    "Have the utilities been disconnected?",
    "Does the property still smell like smoke?",
  ];

  Widget GetMenuList(context, IconData iconData, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.black87,
                    fontSize: 19,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 22,
              color: ThemeColors.headline6_color_lt,
            ),
          )
        ],
      ),
    );
  }
}
