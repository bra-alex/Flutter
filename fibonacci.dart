void main() {
  int prevNum = 0;
  int currentNum = 1;
  int nextNum;
  while (currentNum < 100) {
    print(currentNum);
    nextNum = prevNum + currentNum;
    prevNum = currentNum;
    currentNum = nextNum;
  }
}
