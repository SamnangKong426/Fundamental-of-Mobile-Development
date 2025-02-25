void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var passedScores = scores.where((x) => x >= 50);
  print(passedScores);
 
}