int _left(int n) {
  return 2*n + 1;
}

int _right(int n) {
  return 2*n + 2;
}

void _heapify(List<int> list, int i, int length) {
  final left = _left(i);
  final right = _right(i);
  int largestIndex;

  if (left < length && list[left] > list[i]) {
    largestIndex = left;
  } else {
    largestIndex = i;
  }
  if (right < length && list[right] > list[largestIndex]) {
    largestIndex = right;
  }

  if (largestIndex != i) {
    final key = list[i];
    list[i] = list[largestIndex];
    list[largestIndex] = key;
    _heapify(list, largestIndex, length);
  }
}

void _createHeap(List<int> list) {
  for (var i = list.length ~/ 2; i >= 0; i--) {
    _heapify(list, i, list.length);
  }
}

List<int> heapSort(List<int> list) {
  _createHeap(list);
  for (var i = list.length-1; i >= 0; i--) {
    final key = list[0];
    list[0] = list[i];
    list[i] = key;
    _heapify(list, 0, i);
  }
  return list;
}

void main(List<String> args) {
  final list = [12, 8, 6, 3, 1, 2, 8];
  heapSort(list);
  print(list);
}