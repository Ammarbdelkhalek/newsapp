abstract class Newsstates {}

class newinitialstate extends Newsstates {}

class changenavigatoinstates extends Newsstates {}

class getbusinessdatastates extends Newsstates {}

class getbusinesserrorstates extends Newsstates {
  final Error;
  getbusinesserrorstates(this.Error);
}

class getbusinesscirclestates extends Newsstates {}

class getsciencecirclestates extends Newsstates {}

class getsiencedatastates extends Newsstates {}

class getscienceerrorstates extends Newsstates {
  final Error;
  getscienceerrorstates(this.Error);
}

class getsportscirclestates extends Newsstates {}

class getsportsdatastates extends Newsstates {}

class getsportserrorstates extends Newsstates {
  final Error;
  getsportserrorstates(this.Error);
}

class changedarkmode extends Newsstates {}
