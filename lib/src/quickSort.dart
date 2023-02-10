int partition(List<int> list, int p, int r) {
  var i = p-1;
  for (var j = p; j < r; j++) {
    if (list[j] < list[r]) {
      i++;
      final key = list[i];
      list[i] = list[j];
      list[j] = key;
    }
  }

  if (i+1 != r) {
    final key = list[i+1];
    list[i+1] = list[r];
    list[r] = key;
  }
  return i+1;
}

List<int> quickSort(List<int> list, [int p = 0, int? r]) {
  r ??= list.length-1;
  if (p < r) {
    final q = partition(list, p, r);
    quickSort(list, p, q-1);
    quickSort(list, q+1, r);
  }
  return list;
}
