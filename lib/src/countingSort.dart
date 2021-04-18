List<int> countingSort(List<int> list, int k) {
  final count = List.filled(k, 0);
  
  // count the values between 0 and list.length-1 in the array
  for (var i = 0; i < list.length; i++) {
    count[list[i]]++;
  }

  // update the count to make it accumulative
  for (var i = 1; i < k; i++) {
    count[i] += count[i-1];
  }

  final sorted = List.filled(list.length, 0);
  
  // add to the sorted while updating the count
  for (var i = list.length-1; i >= 0; i--) {
    sorted[count[list[i]]-1] = list[i];
    count[list[i]]--;
  }

  return sorted;
}

