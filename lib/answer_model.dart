// AnsserType enum을 만들어봅시다.

// 답변 종류
enum AnswerType {
  strongYes,
  yes,
  littleYes,
  neutral,
  littleNo,
  no,
  strongNo,
}

// 지금까지 사용자가 답변을 한 전체 답변
// - 키: Question ID
// - 값: 답변
Map<String, AnswerType> allSelectedAnswers = {};

// 특정 키에 접근하고 싶을때
// print(allSelectedAnswers[키]);

// 특정 키의 값을 가져오고 싶을때
// print(allSelectedAnswers)
