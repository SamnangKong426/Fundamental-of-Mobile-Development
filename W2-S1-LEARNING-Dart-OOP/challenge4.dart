class Distance {
  // These 3 attribute can be only 1 so another must be null
  final double? _cms;
  final double? _meters;
  final double?_kms;

  // Use named Contructor
  // Only one can be use
  Distance.cms(this._cms, [this._meters, this._kms]);
  Distance.meters(this._meters, [this._cms, this._kms]);
  Distance.kms(this._kms, [this._cms, this._meters]);
  
  // Use getters
  // calculate cms in case facing null variable
  double get cms {
    if (this._cms != null) {
      return this._cms;
    } else if (this._meters != null) {
      return this._meters * 10;
    } else {
      return this._kms! * 100;
    }
  }

  double get meters {
    if (this._meters != null) {
      return this._meters;
    } else if (this._cms != null) {
      return this._cms / 10;
    } else {
      return this._kms! * 10;
    }
  }

  double get kms {
    if (this._kms != null) {
      return this._kms;
    } else if (this._meters != null) {
      return this._meters / 10;
    } else {
      return this._cms! / 100;
    }
  }

  // Use Operator overloading
  Distance operator + (covariant Distance p) {
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
  print((d1 + d2).kms); // Output = 3.4km + 100km = 103.4
}