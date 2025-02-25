class BankAccount {
  final int accountId;
  final String accountOwner;
  double currentBalance;

  BankAccount(this.accountId, this.accountOwner, [this.currentBalance = 0]);

  void withdraw(double amount) {
    // Deducts the given amount from the account balance
    if (amount < this.currentBalance) {
      this.currentBalance -= amount;
    } else {
      throw ("Insufficient balance for withdrawal!");
    }
  }

  void credit(double amount) {
    // Adds the given amount to the account balance
    this.currentBalance += amount;
  }

  double get balance => this.currentBalance;

  @override
  String toString() {
    return "Account: $accountId, Balance: $balance";
  }
}

class Bank {
  final String name;
  final List<int> accounts = []; // list of accounts id

  Bank({required this.name});  
  
  BankAccount createAccount(int accountId, String accountOwner) {    
    if (this.accounts.contains(accountId))
    {
      throw ("Account with ID ${accountId} already exists!");
    }
    BankAccount newAccount = new BankAccount(accountId, accountOwner);
    accounts.add(newAccount.accountId);
    print(accounts);
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
