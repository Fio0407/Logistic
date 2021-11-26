# Project1: Build a logistic department

## To Start:
You have to build an application for a company, this company manages 3 types of products until today:
- Product A which unit cost is 9 dollars.
- Product B which unit cost is 5 dollars.
- Product C which unit cost is 2 dollars.

You have 50 units of A product, 45 of B Product and 75 of C product.

## Features from customer:

### Menu:
The menu has 5 options:  
- Show stocks.
- Add new products.
- Retire products.
- Show movements of product.
- Exit.

### Show stocks:
- You should show the type, quantity, and total cost of each product. 
- You can choose the format that you like.

### Add new products:
- When adding a new product the program should ask you for type, quantity, and unit cost.
- When products are saved, you should send a confirmation message.
- What happens if you add an existing product with different unit costs?
    - You should calculate the weighted average.

### Retire products:
- When you request products, the program needs to ask you for type, and quantity.
- If you have enough product to supply you should show a confirmation message.
- Else if you don't have enough product for the request, show "The request exceeds the current stock"

### Show movements of product:
- The program asks you the type.
- You should show all the movements (outputs and inputs in the order they occurred)

### Exit:
- You should show a farewell message and their names.

## Constraints:

- The products only can name with a letter.
- The program will run in the console.

## Score:
- I evalute your creativity, clean code, the manage of functions and data structures.
- Use git correctly are extra points.
- Use new things is valued, as long as you have applied that you learned well.
- The work in the group it's the most important here, and the way your team manages the project.


### Tip:
- Think of all things you need to complete this project, use paper and pencil to plan your system design.
- Don't forget to install and use Rubocop writing `rubocop` in the command line.