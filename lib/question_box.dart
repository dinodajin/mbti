// 질문 박스 위젯

import 'package:flutter/material.dart';
import 'package:mbti_app/answer_model.dart';
import 'package:mbti_app/question_model.dart';

class QuestionBox extends StatefulWidget {
  const QuestionBox({super.key, required this.question});

  final Question question;

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox>
    with AutomaticKeepAliveClientMixin {
  AnswerType? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.question.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 동그라미 7개
              _buildCircle(
                width: 50,
                height: 50,
                color: Color(0xFF33A474),
                answerType: AnswerType.strongYes,
                label: '그렇다',
              ),
              _buildCircle(
                  height: 40,
                  width: 40,
                  color: Color(0xFF33A474),
                  answerType: AnswerType.yes),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF33A474),
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              _buildCircle(
                  height: 30,
                  width: 30,
                  color: Color(0xFF33A474),
                  answerType: AnswerType.littleYes),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 30,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF33A474),
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              _buildCircle(
                  height: 20,
                  width: 20,
                  color: Colors.grey,
                  answerType: AnswerType.neutral),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 20,
              //   height: 20,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.grey,
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              _buildCircle(
                  height: 30,
                  width: 30,
                  color: Color(0xFF88619A),
                  answerType: AnswerType.littleNo),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 30,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF88619A),
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              _buildCircle(
                  height: 40,
                  width: 40,
                  color: Color(0xFF88619A),
                  answerType: AnswerType.no),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF88619A),
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF88619A),
              //       width: 2,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              _buildCircle(
                height: 50,
                width: 50,
                color: Color(0xFF88619A),
                answerType: AnswerType.strongNo,
                label: '아니다',
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 그렇다
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "그렇다",
                  style: TextStyle(
                    color: Color(0xFF33A474),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // 아니다
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "아니다",
                  style: TextStyle(
                    color: Color(0xFF88619A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircle({
    required double width,
    required double height,
    required Color color,
    required AnswerType answerType,
    String? label,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnswer = answerType;

          // 내가 선택한 답변을 allSelectedAnswers에 넣어준다.
          allSelectedAnswers[widget.question.id] = answerType;
          print(allSelectedAnswers);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _selectedAnswer == answerType ? color : Colors.transparent,
          border: Border.all(
            color: color,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
