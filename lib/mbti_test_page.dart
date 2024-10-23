import 'package:flutter/material.dart';
import 'package:mbti_app/answer_model.dart';
import 'package:mbti_app/question_box.dart';
import 'package:mbti_app/question_model.dart';
import 'package:mbti_app/result_page.dart';

class MbtiTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/logo.png",
              width: 30,
              height: 30,
            ),
            // SizedBox(width: 12), -> 아래 코드와 같은 의미
            Container(
              width: 12,
            ),
            Text(
              "MBTI 검사 앱",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              // Header 영역
              _buildHeader(),
              for (var question in questions)
                QuestionBox(
                  question: question,
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // 답변을 다 안 한 경우에는 아래 코드가 실행되지 않도록 방지하는 코드를 만들어보자.
              // MBTI 결과를 받아오기
              final String mbti =
                  calculateMBTI(questions, allSelectedAnswers.values.toList());
              print(mbti);

              // MBTI 결과 페이지로 이동
              // Navigator: 페이지를 이동할 수 있는 엘레베이터
              Navigator.of(context).push(
                // push: 새로운 화면을 밀어 넣겠다는 뜻

                // MaterialPageRoute: Material 스타일로 화면 이동하는 방식
                MaterialPageRoute(builder: (BuildContext context) {
                  return ResultPage(result: mbti);
                }),
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xFF863BA6),
                ),
                child: Center(
                  child: Text(
                    "결과 보기",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color(0xFF33A474),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MBTI 테스트",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "MBTI Testing App",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 1,
            color: Colors.white10,
          ),
          // SizedBox(height: 8),
          // Divider(
          //   color: Colors.white12,
          //   thickness: 1,
          // ),
          Container(
            height: 10,
          ),
          _buildGuideBox(
              imagePath: "assets/header_icon1.png",
              text: "자신의 성격 유형을 확인할 수 있도록 솔직하게 답변해 주세요."),
          // Container(
          //   // margin: EdgeInsets.only(bottom: 20),
          //   height: 70,
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   decoration: BoxDecoration(
          //     color: Color(0xFFDEECE7),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         "assets/header_icon1.png",
          //         width: 40,
          //         height: 40,
          //       ),
          //       // SizedBox(width: 12),
          //       Container(
          //         width: 20,
          //       ),
          //       Expanded(
          //         // 텍스트가 화면을 넘어가지 않도록 Expanded로 감쌈
          //         child: Text(
          //           "자신의 성격 유형을 확인할 수 있도록 솔직하게 답변해 주세요.",
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Colors.black,
          //             fontWeight: FontWeight.normal,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            height: 10,
          ),
          _buildGuideBox(
              imagePath: "assets/header_icon2.png",
              text: "자신의 성격 유형이 삶의 여러 영역에 어떤 영향을 미치는지 알아보세요."),
          // Container(
          //   height: 70,
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   decoration: BoxDecoration(
          //     color: Color(0xFFDEECE7),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         "assets/header_icon2.png",
          //         width: 40,
          //         height: 40,
          //       ),
          //       // SizedBox(width: 12),
          //       Container(
          //         width: 20,
          //       ),
          //       Expanded(
          //         // 텍스트가 화면을 넘어가지 않도록 Expanded로 감쌈
          //         child: Text(
          //           "자신의 성격 유형이 삶의 여러 영역에 어떤 영향을 미치는지 알아보세요.",
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Colors.black,
          //             fontWeight: FontWeight.normal,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            height: 10,
          ),
          _buildGuideBox(
              imagePath: "assets/header_icon3.png",
              text: "프리미엄 자료로 원하는 사람으로 성장하세요."),
          // Container(
          //         height: 70,
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         decoration: BoxDecoration(
          //           color: Color(0xFFDEECE7),
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Image.asset(
          //               "assets/header_icon3.png",
          //               width: 40,
          //               height: 40,
          //             ),
          //             // SizedBox(width: 12),
          //             Container(
          //               width: 20,
          //             ),
          //             Expanded(
          //               // 텍스트가 화면을 넘어가지 않도록 Expanded로 감쌈
          //               child: Text(
          //                 "프리미엄 자료로 원하는 사람으로 성장하세요.",
          //                 style: TextStyle(
          //                   fontSize: 12,
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.normal,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      // backgroundColor: Color(0xFF33A474),
    );
  }

  Widget _buildGuideBox({required String imagePath, required String text}) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFDEECE7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          Container(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
