enum Skill { FLUTTER, DART, OTHER }

// Q1.
enum City { Phnom_Penh, Paris, Washington_DC }

class Address {
  final String street;
  final City city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  // Q3. Make all attributes private
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final int _yearsOfExperience;

  var salary = {
    "BaseSalary": 40000,
    "ExperiencesPerYear": 2000,
    "FLUTTER": 5000,
    "DART": 3000,
    "OTHER": 1000
  };

  Employee(this._name, this._baseSalary, this._skills, this._yearsOfExperience);

  // Q2. Update the constructor
  Employee.mobileDeveloper(
      this._name, this._baseSalary, this._skills, this._yearsOfExperience) {
    _skills.addAll([Skill.FLUTTER, Skill.DART]);
  }

  double computeSalary() {
    this.salary["BaseSalary"] = this._baseSalary.toInt();
    double totalSalary = 0;
    totalSalary += this.salary["BaseSalary"]! +
        this.salary["ExperiencesPerYear"]! *
            _yearsOfExperience; // based on Base salary and experices

    // add salary based on skill
    for (var key in this._skills) {
      if (salary.containsKey(key.name)) {
        totalSalary += salary[key.name]!;
      }
    }
    return totalSalary;
  }

  void printDetails() {
    print(
        'Employee: $_name, Base Salary: \$${_baseSalary}, Skills: $_skills, Years of Experices: $_yearsOfExperience, Total Salary: $totalsalary');
  }

  // Q3. provide getter methods for accessing private attributes
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skills;
  int get yearsOfExperience => _yearsOfExperience;

  double get totalsalary => computeSalary();
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER], 3);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.OTHER], 5);
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper("Ti", 50000, [Skill.OTHER], 5);
  emp3.printDetails();
}
