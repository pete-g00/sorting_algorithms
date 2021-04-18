import 'package:sorting_algorithms/sorting_algorithms.dart';
import 'package:test/test.dart';

import 'dart:math';

List<int> _generatedRandomList(int length) {
  final list = <int>[];
  final rnd = Random();
  for (var i = 0; i < length; i++) {
    list.add(rnd.nextInt(10*length));
  }
  return list;
}

bool checkWorks(List<int> Function(List<int>) sortingAlg) {
  final length = 500;
  for (var i = 0; i < 100; i++) {
    var list1 = _generatedRandomList(length);
    final list2 = List.generate(length, (i) => list1[i])
      ..sort();
    list1 = sortingAlg(list1);
    for (var j = 0; j < length; j++) {
      if (list1[j] != list2[j]) {
        return false;
      }
    }
  }
  return true;
}

void main() {
  group('Testing the algorithms.', () {
    test('Insertion Sort test', () {
      expect(checkWorks(insertionSort), isTrue);
    });

    test('Selection Sort test', () {
      expect(checkWorks(selectionSort), isTrue);
    });

    test('Counting Sort test', () {
      expect(checkWorks((List<int> list) => countingSort(list, 5000)),
      isTrue);
    });

    test('Radix Sort test', () {
      expect(checkWorks((List<int> list) => radixSort(list, 4)), isTrue);
    });
  });
}
