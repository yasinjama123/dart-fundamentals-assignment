Q1: List<int> only allows integers, while List<dynamic> allows any type (String, bool, etc.). Type safety is better because it catches errors at compile-time and allows the editor to provide better autocompletion.
Q2: If you initialize to 0 and the list only contains negative numbers (e.g., [-5, -10]), your function would incorrectly return 0 as the max. Starting with numbers[0] ensures the result is a real value from the set.
Q3: This demonstrates Code Reuse (or the DRY principle). It reduces bugs because if you fix the sum logic in one place, the average logic is automatically updated.
Q4: A for-in loop iterates directly over the elements. A traditional for loop uses an index (i). Use for-in when you just need the values; use traditional when you need to know the specific position (index) of the items.
Q5: It would crash (RangeError) because numbers[0] doesn't exist. To handle it, you should check if (numbers.isEmpty) at the start and return a default value or throw a custom error.
Q6: A synchronous function blocks execution until it finishes, while an asynchronous function allows other tasks to run while it waits. divide() is synchronous because math is instant; computeAsync() is asynchronous to simulate high-latency tasks like network requests.
Q7: The await keyword pauses the function until the Future completes. If you forget it, the program returns an "uncompleted" Instance of 'Future<double>' instead of the actual number.
Q8: The try-catch block prevents the app from crashing when an error (like division by zero) occurs. Without it, the error would stop the program entirely.
Q9: Throwing an ArgumentError follows the Single Responsibility Principle. It tells the caller that the input was invalid, letting the UI decide how to show that error rather than forcing a specific print statement inside a logic method.
Q10: The async keyword on main() allows the use of await inside the main body. While you could use .then() callbacks, it would be much harder to read and organize. 


QR1. Which concept was hardest to understand?
The hardest concept was definitely async/await. Initially, it was confusing why a function wouldn't just return a value immediately. The "moment of clarity" came when I forgot to use await and saw Instance of 'Future<double>' printed to the console instead of my result. I realized that a Future is like a "IOU" or a receipt for a value that hasn't arrived yet. Using await is essentially telling the program to "sit tight" until that receipt turns into actual data.
QR2. Transitioning to List in Task 1.
If I had to switch from int to double, I would need to change the type definitions in at least five places: the parameter types for all four functions and the variable declaration in main(). This highlights that data types are the foundation of logic. If I don't design with the correct type (like using int when the data might have decimals), the program will either crash or lose precision. It's much easier to design for the correct type upfront than to refactor a large codebase later.
QR3. Real-world Asynchronous Operations.
In a real Flutter app, like a Weather App, you would need to await a network request to an API (like OpenWeatherMap). The Future would resolve to a JSON string or a Weather object. While the user is waiting, the UI should show a Loading Spinner (CircularProgressIndicator). Without async/await, the entire app would "freeze" and become unresponsive while waiting for the satellite data to travel across the internet.
QR4. Single Function vs. Separate Methods.
I would tell my colleague that there are benefits to both, but separate methods are generally better for testing and maintenance.
Separate Methods (add, subtract): These are easy to unit test individually and make the code "self-documenting." You don't have to worry about typos in a String parameter (like writing "addd" instead of "add").
Single Function (Switch Statement): This is useful for "routing" logic (like in our computeAsync method), but it shouldn't hold the actual math logic.
Keeping them separate follows the Single Responsibility Principle, making the code cleaner and less prone to "spaghetti" logic.
