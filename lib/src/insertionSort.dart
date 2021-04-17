List<int> insertionSort(List<int> list) {
  for (var i = 1; i < list.length; i++) {
    final value = list[i];
    var j = i-1;
    
    // shift all the elements in the sorted sublist that are bigger than key:
    // if the element in list is bigger than a value within the sorted sublist, increment it by 1.
    while (j >= 0 && list[j] > value){
      list[j+1] = list[j];
      j--;
    }
    
    // put this value before all the elements bigger than it
    list[j+1] = value;
  }
  return list;
}
