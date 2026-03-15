// Task 1: Number Analysis App (Enhanced with Bonus Challenges)
// Name: [Your Name Here]

/// Bonus: Empty List Guard Utility
bool isEmpty(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Warning: The list is empty. Returning default value.');
    return true;
  }
  return false;
}

int findMax(List<int> numbers) {
  if (isEmpty(numbers)) return 0; // Guard
  int max = numbers[0];
  for (int num in numbers) {
    if (num > max) max = num;
  }
  return max;
}

int findMin(List<int> numbers) {
  if (isEmpty(numbers)) return 0; // Guard
  int min = numbers[0];
  for (int num in numbers) {
    if (num < min) min = num;
  }
  return min;
}

int calculateSum(List<int> numbers) {
  if (isEmpty(numbers)) return 0; // Guard
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) return 0.0; // Guard
  return calculateSum(numbers) / numbers.length;
}

/// Bonus: Count Negatives (2 pts)
int countNegatives(List<int> numbers) {
  int count = 0;
  for (int num in numbers) {
    if (num < 0) count++;
  }
  return count;
}

/// Bonus: Manual Bubble Sort (3 pts)
List<int> manualSort(List<int> numbers) {
  // Create a copy so we don't modify the original list
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;
  
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (sortedList[j] > sortedList[j + 1]) {
        // Swap elements
        int temp = sortedList[j];
        sortedList[j] = sortedList[j + 1];
        sortedList[j + 1] = temp;
      }
    }
  }
  return sortedList;
}

/* 
  Bonus: Collection Methods Comparison (3 pts)
  - Max: numbers.reduce((a, b) => a > b ? a : b);
  - Sum: numbers.fold(0, (prev, element) => prev + element);
  - Negatives: numbers.where((n) => n < 0).length;
  
  Trade-offs: Manual loops are more verbose but easier for beginners to debug step-by-step. 
  Built-in methods (fold/reduce) are more concise ("functional style") and preferred in 
  professional Flutter development for readability.
*/

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  print('Number Analysis Results');
  print('========================');
  print('Original List: $numbers');
  print('Sorted List  : ${manualSort(numbers)}'); // Bonus Sort
  print('Maximum value: ${findMax(numbers)}');
  print('Minimum value: ${findMin(numbers)}');
  print('Sum          : ${calculateSum(numbers)}');
  print('Average      : ${calculateAverage(numbers).toStringAsFixed(1)}');
  print('Negatives    : ${countNegatives(numbers)}'); // Bonus Count
}
