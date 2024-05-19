import 'package:dostx/pages/brief_cope_page.dart';
import 'package:dostx/pages/brief_cope_results_page.dart';
import 'package:dostx/pages/client_details.dart';
import 'package:dostx/pages/cope.dart';
import 'package:dostx/pages/coping_strategies_page.dart';
import 'package:dostx/pages/coping_strategy_about.dart';
import 'package:dostx/pages/cost_effective_analysis_page.dart';
import 'package:dostx/pages/emothional_wheeel_reults.dart';
import 'package:dostx/pages/emotional_wheel.dart';
import 'package:dostx/pages/emotional_wheel_2.dart';
import 'package:dostx/pages/family_burden_results_page.dart';
import 'package:dostx/pages/family_burden_scale_page.dart';
import 'package:dostx/pages/familyburden.dart';
import 'package:dostx/pages/homePage.dart';
import 'package:dostx/pages/medical_reminder.dart';
import 'package:dostx/pages/psychoeducation_page.dart';
import 'package:dostx/pages/short12.dart';
import 'package:dostx/pages/zarit_burden_results_page.dart';
import 'package:dostx/pages/zarit_scale_page.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/services.dart';
import 'pages/profilepage.dart';
import 'language_manager.dart';
import 'globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _selectedIndex = 1;
  int _previousIndex = 1;
  String _selectedSubPage = "default";
  String _previousSubPage = "default";
  List<String>_previousSubPageTrack = ["default"];

  void _updateNavigation(int index){
    _previousIndex = _selectedIndex;
    setState(() {
      _selectedIndex=index;
    });
  }
  void _updateSubPage(String pageName, [bool overrideTrack = false]){
    if(overrideTrack){
      _previousSubPageTrack = <String>["default"];
      _previousSubPage = "default";
      setState(() {
        _selectedSubPage=pageName;
      });

    }else{
      if(_previousSubPageTrack.isEmpty){
        _previousSubPageTrack.add("default");
      }

      if (pageName != _previousSubPage){
        _previousSubPage = _selectedSubPage;
        _previousSubPageTrack.add(_previousSubPage);
        setState(() {
          _selectedSubPage=pageName;
        });
      }else{
        if(_previousSubPageTrack.length >1){
          _previousSubPageTrack.removeLast();
        }
        _previousSubPage =_previousSubPageTrack.last;
        setState(() {
          _selectedSubPage=pageName;
        });
      }
    }
  }
  int _getPrevIndex(){
    return _previousIndex;
  }
  String _getPrevSubPage(){
    return _previousSubPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  _selectedIndex != 0
          ? const Color(
        0xFFFEBEB1,
      )
          : const Color(0xffFFF2E3),
      appBar: (_selectedIndex==0 || _selectedIndex==1)&&(_selectedSubPage=="default")?AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,

        backgroundColor: _selectedIndex != 0
            ? const Color(
                0xFFFEBEB1,
              )
            : const Color(0xffFFF2E3),
        title: Image.asset(
          'assets/image/logo.png',
          width: 78,
          // height: 27,
          // height: 80,
                ),

        leadingWidth: 100,
        leading:  Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: SvgPicture.asset(
                'assets/svg/lang.svg',
                width: 41,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Language'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('English'),
                            onTap: () {
                              // Set English language
                              LanguageManager().setLanguage('en');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                          ),
                          ListTile(
                            title: Text('Hindi'),
                            onTap: () {
                              // Set Hindi language
                              LanguageManager().setLanguage('hi');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Marathi'),
                            onTap: () {
                              // Set Marathi language
                              LanguageManager().setLanguage('mr');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/language_icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.black, // Optionally customize the color
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: (_selectedIndex==1)?[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle bell icon tap
            },
          ),
        ]:null,
      ):null,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 48,
            offset: Offset(0, 2),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildIconButton(Icons.home, 0),
              Spacer(),
              _buildIconButton(Icons.person, 1),
              Spacer(),
              _buildIconButton(Icons.messenger_rounded, 2),
              Spacer(),
              _buildIconButton(Icons.calendar_today, 3),
            ],
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked:(bool didPop){
          if (didPop){
            return;
          }
          if (_selectedSubPage == "default"){
            if(_selectedIndex == 1){
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              return;
            }
            else if(_previousIndex == 1 || _previousIndex ==0){
              _updateNavigation(_previousIndex);
              return;
            }else if(_selectedIndex == 0){
              _updateNavigation(1);
              return;
            }
          }else{
            _updateSubPage(_previousSubPage);
          }
        } ,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // gradient: GradientOptions.backgroundGradient,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(
                  0xFFFFFFFF,
                ),
                Color(
                  0xFFFEBEB1,
                ),
              ],
            ),
          ),
          child: Center(
            child: _buildBodyContent(_selectedIndex, _selectedSubPage),
          ),
        ),
      ),
    );
  }

  // Method to create IconButton with specified index
  Widget _buildIconButton(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        // if(index == 3){
        //               Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>  MedicalReminderPage(),
        //       ),
        //     );
        //               return;
        // }
        // setState(() {
        //   _selectedIndex = index;
        // });
        _updateNavigation(index);
        _updateSubPage("default");
      },
      icon: Icon(
        icon,
        size: 30,
        color:
            _selectedIndex == index ? ColorOptions.skin : ColorOptions.darkblue,
      ),
    );
  }

  // Method to build body content based on selected index
  Widget _buildBodyContent(int index, String subPage) {
    switch (index) {
      case 0:
        switch(subPage) {
          case "psycho_education":
            return PsychoEducationPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "zarit_burden_results":
            return ZaritBurdenResultsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "zarit_scale_1":
            return ZaritScalePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "zarit_scale_2":
            return Short12Page(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "emotional_wheel_results":
            return EmotionalWheelResultsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "emotional_wheel_1":
            return EmotionalWheel(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "emotional_wheel_2":
            return EmotionalWheel2(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "family_burden_results":
            return FamilyBurdenResultsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "family_burden_1":
            return FamilyBurdenScalePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );
          case "family_burden_2":
            return familyBurden(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "brief_cope_results":
            return BriefCopeResultsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "brief_cope_1":
            return BriefCopePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "brief_cope_2":
            return CopePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "cope_strategy_test":
            return CopingStrategyAboutPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
              title: "The Art of Self-Love",
              imageUrl: "assets/image/coping (2).png",
              description: "Embracing Yourself Fully:\n Self-love is a journey that many of us embark on but few of us fully understand. It’s about more than just treating yourself or indulging in self-care rituals; it’s about developing a deep, nurturing relationship with yourself that allows you to thrive in all areas of life. Here’s how to cultivate self-love, with insights gathered from various experts and sources.\n\nUnderstanding Self-Love:\n Self-love is the regard for one’s own well-being and happiness. It is not merely a state of feeling good but is a state of appreciation for oneself that grows from actions supporting our physical, psychological, and spiritual growth (Good Therapy). When you love yourself, you are better equipped to make healthier choices, engage in more fulfilling relationships, and navigate the challenges of life with resilience and grace.Embracing Yourself Fully:\n Self-love is a journey that many of us embark on but few of us fully understand. It’s about more than just treating yourself or indulging in self-care rituals; it’s about developing a deep, nurturing relationship with yourself that allows you to thrive in all areas of life. Here’s how to cultivate self-love, with insights gathered from various experts and sources.\n\nUnderstanding Self-Love:\n Self-love is the regard for one’s own well-being and happiness. It is not merely a state of feeling good but is a state of appreciation for oneself that grows from actions supporting our physical, psychological, and spiritual growth (Good Therapy). When you love yourself, you are better equipped to make healthier choices, engage in more fulfilling relationships, and navigate the challenges of life with resilience and grace.",
              );
            
          case "default":
          return HomePageFirst(
            updateHomeIndex: _updateNavigation,
            getPrevPageIndex: _getPrevIndex,
            updateSubPage: _updateSubPage,
            getPrevSubPage: _getPrevSubPage,
          );

          default:
            return Center(child: Text("404: Page Not Found!"),);

        }
      case 1:
        switch(subPage){

          case "cost_effectiveness_analysis":
            return CostEffectiveAnalysisPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "client_details":
            return ClientDetailsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );


          default:
            return ProfilePage(
              updateHomeIndex: _updateNavigation,
              getPrevPageIndex: _getPrevIndex,
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );
        }
      case 2:
        switch(subPage){
          case "cope_strategy_test":
            return CopingStrategyAboutPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
              title: "The Art of Self-Love",
              imageUrl: "assets/image/coping (2).png",
              description: "Embracing Yourself Fully:\n Self-love is a journey that many of us embark on but few of us fully understand. It’s about more than just treating yourself or indulging in self-care rituals; it’s about developing a deep, nurturing relationship with yourself that allows you to thrive in all areas of life. Here’s how to cultivate self-love, with insights gathered from various experts and sources.\n\nUnderstanding Self-Love:\n Self-love is the regard for one’s own well-being and happiness. It is not merely a state of feeling good but is a state of appreciation for oneself that grows from actions supporting our physical, psychological, and spiritual growth (Good Therapy). When you love yourself, you are better equipped to make healthier choices, engage in more fulfilling relationships, and navigate the challenges of life with resilience and grace.Embracing Yourself Fully:\n Self-love is a journey that many of us embark on but few of us fully understand. It’s about more than just treating yourself or indulging in self-care rituals; it’s about developing a deep, nurturing relationship with yourself that allows you to thrive in all areas of life. Here’s how to cultivate self-love, with insights gathered from various experts and sources.\n\nUnderstanding Self-Love:\n Self-love is the regard for one’s own well-being and happiness. It is not merely a state of feeling good but is a state of appreciation for oneself that grows from actions supporting our physical, psychological, and spiritual growth (Good Therapy). When you love yourself, you are better equipped to make healthier choices, engage in more fulfilling relationships, and navigate the challenges of life with resilience and grace.",
            );
          default:
            return CopingStrategiesPage(
              updateHomeIndex: _updateNavigation,
              getPrevPageIndex: _getPrevIndex,
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            ); //Text('Messenger Page Content');
        }
      case 3:
        switch(subPage) {
          default:
            return MedicalReminderPage(
              updateHomeIndex: _updateNavigation,
              getPrevPageIndex: _getPrevIndex,
            ); //
        }// Text('Calendar Page Content');
      default:
        return Container();
    }
  }
}