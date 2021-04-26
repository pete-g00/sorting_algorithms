void merge(List<int> list, int p, int q, int r) {
  final list1 = list.sublist(p, q+1);
  final list2 = list.sublist(q+1, r+1);

  var i = 0;
  var j = 0;
  for (var k = p; k <= r; k++) {
    if (i >= list1.length) {
      list[k] = list2[j];
      j++;
    } else if (j >= list2.length) {
      list[k] = list1[i];
      i++;
    } else if (list1[i] <= list2[j]) {
      list[k] = list1[i];
      i++;
    } else {
      list[k] = list2[j];
      j++;
    }
  }
}

List<int> mergeSort(List<int> list, [int p = 0, int r]) {
  r ??= list.length-1;
  if (p < r) {
    final q = (p+r)~/2;
    mergeSort(list, p, q);
    mergeSort(list, q+1, r);
    merge(list, p, q, r);
  }
  return list;
}
