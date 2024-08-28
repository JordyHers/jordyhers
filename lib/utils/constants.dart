import 'package:jordyhers/models.dart';

const double kHomeOffset = 10.0;
const double kAppsAndPackagesOffset = 1700.0;
const double kBookSessionOffset = 2400.0;
const double kVideoOffset = 1000.0;
const double kAboutOffset = 3400.0;
const double kCommunityOffset = 6600.0;

const videoHome = 'assets/videos/IMG_3398.MOV';
const thumbnail = 'assets/images/thumbnail.png';
const videoProfile = 'assets/videos/IMG_3400.mov';
const github = 'https://github.com/JordyHers';
const linkedIn = 'https://de.linkedin.com/company/jordyhers-org';
const githubTimesUp = 'https://github.com/JordyHers/Times-up-flutter';
const githubOwanto = 'https://github.com/JordyHers/Owanto_e-commerce';
const githubTerminal = 'https://github.com/JordyHers/terminal';
const githubIos = 'https://github.com/JordyHers/iosAppTutorials';
const discordLink = 'https://discord.gg/NBFyRmJd35';

// Define the URLs as constants
const String kModePazUrl =
    'https://play.google.com/store/apps/details?id=com.jordyhers.modepaz_prod&hl=en';
const String kFlutterAnyLogoUrl = 'https://pub.dev/packages/flutter_any_logo';
const String kFlutterResumeTemplateUrl =
    'https://pub.dev/packages/flutter_resume_template';
const String kFlutterFloatyWidgetUrl =
    'https://pub.dev/packages/flutter_floaty';

const String aboutMe =
    "I'm Jordy Hershel IGONDJO,\n\n I'm on my way to become a Flutter GDE. I've been writing code professionally for over 6 years. "
    "I've been a mobile app developer since I graduated from University, working for startups, agencies, and big companies."
    "I've helped thousands of students become better developers by teaching development tools and relevant techniques to students."
    "   I know what it takes to become a good Flutter developer. I can't wait to get in touch with you so feel free to contact me through email.\n\n";

const String why_flutter = "1. Fast Development\n\n"
    "Flutter is faster than many other application development frameworks. With its 'hot reload' feature, you can experiment, build UIs, add/remove features, test and fix bugs faster. Thus reducing the overall app development time.\n\n"
    "2. Expressive and Flexible UI \n\n"
    "You can really build beautiful apps in Flutter. Also, the end-user experience is similar to native apps. Flutter has a layered architecture that lets you control every pixel on the screen. "
    "Thus, customization is very simple in Flutter.\n\n"
    " With its powerful composting capabilities, you can overlay and animate graphics, text, video, and other controls without any limitations."
    "You’ll also find a set of widgets that deliver pixel-perfect experiences on Android and iOS. It enables the ultimate realization of Material Design. "
    "Just in case you don’t know, Material.io is Google’s initiative to build beautiful, usable products with Material Components for digital experiences.\n\n"
    "3. Native Performance\n\n"
    "Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts.\n This provides a native performance experience on both iOS and Android.\n\n"
    "4. Dart Language\n\n"
    "Dart programming language is developed by Google and is meant for mobile, desktop, backend and web applications. It is a client-optimized language for fast performing apps on multiple platforms."
    "Dart is AOT (Ahead Of Time) compiled to fast, predictable, native code, allowing writing almost all of Flutter code in Dart. This makes Flutter extremely fast and customizable. "
    "Virtually, everything (including all the widgets) can be customized.\n\n"
    "5. Important Flutter Tools\n\n"
    "Flutter framework supports many different tools including Android Studio and Visual Studio Code. It also provides support for building apps from the command line. Dart DevTools, which is a new debugging tool, is more flexible and allows runtime inspection. You can also view logs, debug apps and inspect widgets for Flutter App Development."
    "Widget inspector helps to visualize and explore the tree hierarchy. \nFlutter uses this for UI rendering."
    "Timeline view helps you to monitor your application at a frame-by-frame level.\n\n"
    " You can also identify rendering and computational work in timeline view."
    "Source-level Debugger: It lets you step through code, set breakpoints and investigate the call stack."
    "Logging View displays events from the Dart runtime, application frameworks and app-level logging events.";

List<EducationModel> education = [
  EducationModel(
    "1. Master Degree - Germany",
    "IU Applied Science University ",
    "2022- Postpone",
  ),
  EducationModel(
    "2.University Bachelor Degree - Turkey",
    " -- Istanbul Gelisim University -- ",
    "2014-2021",
  ),
  EducationModel(
    "3. High-school - Gabon",
    " -- Lycée Privé René Descartes -- ",
    "2011-2014",
  ),
];

List<ExperienceModel> experienceList = [
  ExperienceModel(
      "Senior Flutter Mobile Application Developer",
      "Wurth Cloud Service · Full-time / Germany",
      "Mar 2023 - Present",
      "https://media.licdn.com/dms/image/C4E0BAQF8lBnVJ6NDyQ/company-logo_100_100/0/1656946168759?e=1680739200&v=beta&t=A5i7uQnt1fKiGr2cWX_-d_SFQbNISWe25y38i0sfuLs"),
  ExperienceModel(
      "Senior Flutter Mobile Application Developer",
      "Mindable Health · Full-time / Germany",
      "Jul 2022 - Mar 2023 · 9 mos",
      "https://media.licdn.com/dms/image/C4E0BAQF8lBnVJ6NDyQ/company-logo_100_100/0/1656946168759?e=1680739200&v=beta&t=A5i7uQnt1fKiGr2cWX_-d_SFQbNISWe25y38i0sfuLs"),
  ExperienceModel(
      "Flutter Mobile Application Developer",
      "Full time / Istanbul, Turkey",
      "Aug 2020 - Jul 2022 · 2 yrs 1 mos",
      "https://media.licdn.com/dms/image/C560BAQGO3vsmV1R8Rw/company-logo_100_100/0/1538446725619?e=1680739200&v=beta&t=baiH7ha0lyqP5d2xmi8_H3R1uHjuBZACKKTxOxlv2RY"),
  ExperienceModel(
      "Freelance Flutter Mobile Application developer",
      "Upwork · Freelance / Remote",
      "Jun 2018 - Jul 2022 · 4 yrs 2 mos",
      "https://media.licdn.com/dms/image/C4E0BAQFAvA55uI9RQQ/company-logo_100_100/0/1620158724382?e=1680739200&v=beta&t=MEhmlJ-ZlRjBORLTJgxm17w7rVDXi6Q1v3qDD2DIDaM"),
  ExperienceModel(
      "Junior React Native Developer",
      "Yeni Eğitim Sistemi · Internship / Istanbul, Turkey",
      "Jul 2021 - Sep 2021 · 3 mos",
      "https://media.licdn.com/dms/image/C560BAQGO3vsmV1R8Rw/company-logo_100_100/0/1538446725619?e=1680739200&v=beta&t=baiH7ha0lyqP5d2xmi8_H3R1uHjuBZACKKTxOxlv2RY"),
  ExperienceModel(
      "Language Consultant",
      "Turkish-American As. Language School · Freelance / Turkey",
      "Jul 2018 - Jul 2019 · 1 yr 1 mo",
      "https://media.licdn.com/dms/image/C510BAQEqU-iJ4nWOBQ/company-logo_100_100/0/1519914449872?e=1680739200&v=beta&t=_i69pjNqgRXKZF94JgNPO4NX1FWIjuPMQzEuhwNuyCw"),
  ExperienceModel(
      "English Second Language Teacher",
      " English Time · Part-time / Istanbul, Turkey",
      "Oct 2017 - Jan 2018 4 mos",
      "https://media.licdn.com/dms/image/C4E0BAQHDHdvgMTL8JQ/company-logo_100_100/0/1519865079469?e=1680739200&v=beta&t=tKHce3ro3GpwNw2FlsqJiAo6Chk4z7qaglRLBl08P9g"),
];
