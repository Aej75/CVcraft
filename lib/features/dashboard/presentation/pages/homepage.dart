import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_app/core/constants/colors.dart';
import 'package:cv_app/core/routes/routes.gr.dart';
import 'package:cv_app/features/dashboard/presentation/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/widgets/tile.dart';
import '../../../../core/widgets/title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  final CarouselController _controller = CarouselController();
//   Future<void> generatePdfFromHtml(String html) async {
//     // Parse the HTML document
//     final document = parser.parse(html);

//     // Get the dimensions of the HTML document
//     final body = document.body;
//     double htmlWidth = 1754;
//     double htmlHeight = 1240;

//     // Create a PDF document
//     final doc = pw.Document();

//     // Add a page to the document

//     // Save the PDF file
//     final file = File('example.pdf');
//     file.create();
//   }

//   Future<void> resizePdf(String inputPath, String outputPath, double width, double height) async {
//   // Open the PDF file
//   final pdf = await PdfDocument.openFile(inputPath);

//   // Modify the size of the pages
//   for (int i = 0; i < pdf.numPages; i++) {
//     final page = pdf.pages[i];
//     page.pageFormat = PdfPageFormat.letter.copyWith(width: width, height: height);
//   }

//   // Save the modified PDF
//   final file = File(outputPath);
//   await file.writeAsBytes(pdf.save());

//   // Close the PDF document
//   pdf.close();
// }

  var htmlContent = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV</title>

    <style>
       .my-div {
    height:11.69in;
    width: 8.27in;
    background-color: blue;
    margin: auto;
    
}

.first-section{
    height: 100%;
    width: 35%;
    background-color: beige;
}


    </style>
</head>
<body style="background-color: grey;">
    <div class="my-div">
      
            <div  class="first-section"></div>
            <div class="second-section"></div>
      
    </div>
</body>
</html>
""";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    writeData();
  }

  final _myBox = Hive.box('myBox');

  void writeData() {
    _myBox.put(1, 'Ajay');
    print(_myBox.get(1));
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      openRatio: 1 / 2,
      openScale: 0.9,
      drawer: SafeArea(
        child: SizedBox(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/onboarding/onboarding_1.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: const Text(
                    'Home',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff508D86),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _advancedDrawerController.showDrawer();
                            },
                            style: TextButton.styleFrom(
                              elevation: 2,
                              foregroundColor: kDarkBlueColor,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(40, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(11),
                              child: Icon(Icons.menu),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 46,
                            child: TextFormField(
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  hintText: 'Search category'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              color: Color(0xff363853),
                              Icons.notifications_outlined,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 15),
                    Container(
                      height: MediaQuery.of(context).size.height / 5.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff1F486D),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CvTitle(title: 'Top Categories'),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CvTile(title: 'Professional'),
                              CvTile(title: 'Simple', onPressed: () {}),
                              const CvTile(title: 'Creative'),
                              const CvTile(title: 'Academic'),
                            ],
                          ).padding(horizontal: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              // TextButton(
              //   onPressed: () async {
              //     // generatePdfFromHtml(htmlContent);
              //     var externalStorageDirPath =
              //         await AndroidPathProvider.documentsPath;
              //     print(externalStorageDirPath);
              //     var targetFileName = "example_pdf_file";

              //     var generatedPdfFile =
              //         await FlutterHtmlToPdf.convertFromHtmlContent(
              //             htmlContent, externalStorageDirPath, targetFileName);

              //     print(generatedPdfFile);
              //   },
              //   child: const Text('Tap me'),
              // ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffFE7A7A),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  // height: MediaQuery.of(context).size.height / 2,
                  child: SliderWidget(
                    onTap: () {
                      context.router.push(const EditTempletPageRoute());
                    },
                    images: const [
                      'https://i0.wp.com/psdfreedownload.com/wp-content/uploads/2017/05/Modern_Simple_Resume_Template_PSD_Full_View.jpg?w=1200&ssl=1',
                      'https://www.mycvstore.com/wp-content/uploads/2019/02/Professional-CV-MS-Word-Template.jpg',
                      'https://www.thegreenerleithsocial.org/wp-content/uploads/2019/11/45-free-modern-resume-cv-templates-minimalist-simple-for-microsoft-word-resume-template-free.jpg',
                      'https://www.resumebuilder.org/wp-content/themes/resumebuilder-theme/images/resumes/Europass-CV-Template-1.png',
                      'https://i.pinimg.com/originals/0e/6e/15/0e6e150aa3e53e1314a93756532e39ff.gif'
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
