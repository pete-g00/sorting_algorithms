import 'dart:math';

int _getNthDigit(int val, int n) {
  return (val ~/ pow(10, n)) % 10;
}

List<int> _countingSort(List<int> list, int digit) {
  final count = List.filled(10, 0);
  
  // count the values between 0 and list.length-1 in the array wrt to nth digit
  for (var i = 0; i < list.length; i++) {
    count[_getNthDigit(list[i], digit)] ++;
  }

  // update the count to make it accumulative
  for (var i = 1; i < 10; i++) {
    count[i] += count[i-1];
  }

  final sorted = List.filled(list.length, 0);
  
  // add to the sorted while updating the count
  for (var i = list.length-1; i >= 0; i--) {
    sorted[count[_getNthDigit(list[i], digit)]-1] = list[i];
    count[_getNthDigit(list[i], digit)]--;
  }

  return sorted;
}

List<int> radixSort(List<int> list, int digitLength) {
  for (var i = 0; i < digitLength; i++) {
    list = _countingSort(list, i);
  }
  return list;
}

