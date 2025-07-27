// Clean Budget Manager Class
class SimpleBudget {
  // Income variables
  double salary = 0;
  double sideIncome = 0;
  double otherIncome = 0;
  
  // Essential expenses (must pay)
  double rent = 0;
  double utilities = 0;
  double food = 0;
  double transport = 0;
  
  // Optional expenses (can reduce)
  double entertainment = 0;
  double shopping = 0;
  double miscellaneous = 0;
  
  // Goals
  double emergencyTarget = 0;
  double currentEmergencyFund = 0;
  double savingsGoal = 0;
  
  // Calculate total income
  double getTotalIncome() {
    return salary + sideIncome + otherIncome;
  }
  
  // Calculate essential expenses
  double getEssentialExpenses() {
    return rent + utilities + food + transport;
  }
  
  // Calculate optional expenses
  double getOptionalExpenses() {
    return entertainment + shopping + miscellaneous;
  }
  
  // Calculate total expenses
  double getTotalExpenses() {
    return getEssentialExpenses() + getOptionalExpenses();
  }
  
  // Calculate money left after expenses
  double getMoneyLeft() {
    return getTotalIncome() - getTotalExpenses();
  }
  
  // Calculate recommended savings (20% of income)
  double getRecommendedSavings() {
    return getTotalIncome() * 0.20;
  }
  
  // Calculate daily spending budget
  double getDailyBudget() {
    double moneyAfterSavings = getMoneyLeft() - getRecommendedSavings();
    return moneyAfterSavings / 30; // 30 days in month
  }
  
  // Check if budget is healthy
  String getBudgetStatus() {
    double moneyLeft = getMoneyLeft();
    
    if (moneyLeft < 0) {
      return "DANGER: You're spending more than you earn!";
    } else if (moneyLeft < getTotalIncome() * 0.10) {
      return "WARNING: Very tight budget, consider reducing expenses";
    } else if (moneyLeft >= getTotalIncome() * 0.20) {
      return "GOOD: Healthy budget with good savings potential";
    } else {
      return "OKAY: Budget is manageable but could be better";
    }
  }
  
  // Get simple suggestions
  List<String> getSimpleSuggestions() {
    List<String> suggestions = [];
    
    if (getMoneyLeft() < 0) {
      suggestions.add("Cut optional expenses immediately");
      suggestions.add("Look for additional income sources");
    }
    
    if (currentEmergencyFund < (getEssentialExpenses() * 3)) {
      suggestions.add("Build emergency fund (3-6 months of essential expenses)");
    }
    
    if (getOptionalExpenses() > getEssentialExpenses() * 0.5) {
      suggestions.add("Optional expenses are too high - reduce entertainment/shopping");
    }
    
    if (getRecommendedSavings() > getMoneyLeft()) {
      suggestions.add("Try to save at least 10% of your income");
    }
    
    return suggestions;
  }
  
  // Print clean budget report
  void printBudgetReport() {
    print('==================================================');
    print('BUDGET REPORT');
    print('==================================================');
    
    // Income section
    print('\nINCOME:');
    print('Salary: KSh ${salary.toStringAsFixed(2)}');
    print('Side Income: KSh ${sideIncome.toStringAsFixed(2)}');
    print('Other Income: KSh ${otherIncome.toStringAsFixed(2)}');
    print('TOTAL INCOME: KSh ${getTotalIncome().toStringAsFixed(2)}');
    
    // Expenses section
    print('\nEXPENSES:');
    print('Essential Expenses:');
    print('  - Rent: KSh ${rent.toStringAsFixed(2)}');
    print('  - Utilities: KSh ${utilities.toStringAsFixed(2)}');
    print('  - Food: KSh ${food.toStringAsFixed(2)}');
    print('  - Transport: KSh ${transport.toStringAsFixed(2)}');
    print('  Essential Total: KSh ${getEssentialExpenses().toStringAsFixed(2)}');
    
    print('\nOptional Expenses:');
    print('  - Entertainment: KSh ${entertainment.toStringAsFixed(2)}');
    print('  - Shopping: KSh ${shopping.toStringAsFixed(2)}');
    print('  - Miscellaneous: KSh ${miscellaneous.toStringAsFixed(2)}');
    print('  Optional Total: KSh ${getOptionalExpenses().toStringAsFixed(2)}');
    
    print('\nTOTAL EXPENSES: KSh ${getTotalExpenses().toStringAsFixed(2)}');
    
    // Money left and savings
    print('\nMONEY LEFT: KSh ${getMoneyLeft().toStringAsFixed(2)}');
    print('Recommended Savings (20%): KSh ${getRecommendedSavings().toStringAsFixed(2)}');
    print('Daily Budget: KSh ${getDailyBudget().toStringAsFixed(2)}');
    
    // Emergency fund
    print('\nEMERGENCY FUND:');
    print('Current: KSh ${currentEmergencyFund.toStringAsFixed(2)}');
    print('Recommended (3 months): KSh ${(getEssentialExpenses() * 3).toStringAsFixed(2)}');
    
    // Budget status
    print('\nBUDGET STATUS:');
    print(getBudgetStatus());
    
    // Suggestions
    print('\nSUGGESTIONS:');
    List<String> suggestions = getSimpleSuggestions();
    if (suggestions.isEmpty) {
      print('Great job! Your budget looks good.');
    } else {
      for (int i = 0; i < suggestions.length; i++) {
        print('${i + 1}. ${suggestions[i]}');
      }
    }
    
    // Future projection
    print('\n6-MONTH PROJECTION:');
    double monthlySavings = getMoneyLeft() * 0.5; // Save 50% of money left
    print('If you save KSh ${monthlySavings.toStringAsFixed(2)} per month:');
    print('Total savings in 6 months: KSh ${(monthlySavings * 6).toStringAsFixed(2)}');
    print('Emergency fund in 6 months: KSh ${(currentEmergencyFund + monthlySavings * 0.3 * 6).toStringAsFixed(2)}');
    
    print('\n==================================================');
  }
}

void main() {
  // Create clean budget
  SimpleBudget myBudget = SimpleBudget();
  
  // Set your income (in Kenyan Shillings)
  myBudget.salary = 500000;          // Your main job
  myBudget.sideIncome = 80000;       // Side hustle/freelance
  myBudget.otherIncome = 20000;      // Any other income
  
  // Set essential expenses (must pay these)
  myBudget.rent = 120000;            // House rent
  myBudget.utilities = 25000;        // Water, electricity, internet
  myBudget.food = 40000;             // Groceries and meals
  myBudget.transport = 20000;        // Travel costs
  
  // Set optional expenses (can reduce these)
  myBudget.entertainment = 25000;    // Movies, dining out, fun
  myBudget.shopping = 15000;         // Clothes, gadgets
  myBudget.miscellaneous = 10000;    // Other random expenses
  
  // Set current savings
  myBudget.currentEmergencyFund = 150000;  // Current emergency savings
  
  // Generate and print report
  myBudget.printBudgetReport();
  
  // Quick budget check
  print('\nQUICK SUMMARY:');
  print('Total Income: KSh ${myBudget.getTotalIncome()}');
  print('Total Expenses: KSh ${myBudget.getTotalExpenses()}');
  print('Money Left: KSh ${myBudget.getMoneyLeft()}');
  print('Daily Budget: KSh ${myBudget.getDailyBudget().toStringAsFixed(2)}');
  print('Status: ${myBudget.getBudgetStatus()}');
}