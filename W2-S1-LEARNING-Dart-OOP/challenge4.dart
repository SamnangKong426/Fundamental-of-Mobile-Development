class Distance {
  final double _cms;

  // Use named Contructor
  // Only one can be use
  Distance.cms(double cms): this._cms = cms;
  Distance.meters(double meters): this._cms = meters * 100;
  Distance.kms(double kms): this._cms = kms * 100000;
  
  // Use getters
  double get cms => this._cms;
  double get meters => this._cms /100;
  double get kms => this._cms /100000;

  // Use Operator overloading
  Distance operator + (Distance p) {
    return Distance.cms(this.cms + p.cms);
  }
}


void main() {
  // Example d1 using named constructor Distance.kms
  Distance d1 = Distance.kms(3.4);
  // print(d1.kms);
  // print(d1.meters);
  // print(d1.cms);
  Distance d2 = Distance.meters(1000);
  // print(d2.kms);
  // print(d2.meters);
  // print(d2.cms);
  // convert to cms and sum it together then covert to kms
  print((d1 + d2).kms); // Output = 3.4km + 1km = 4.4km
}