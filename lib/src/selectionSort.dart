List<int> selectionSort(List<int> list) {
  for (var i = 0; i < list.length - 1; i++) {
    // compute the index of the minimum element in the unsorted sublist
    var min = i;
    for (var j = i+1; j < list.length; j++) {
      if (list[j] < list[min]) {
        min = j;
      }
    }
    
    // swap the element in this index with the minimum element
    var temp = list[i];
    list[i] = list[min];
    list[min] = temp;
  }
  return list;
}
