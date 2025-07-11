class Verfiy {}

class Verfypasswordstates extends Verfiy {}

class VPasswordLoadingState extends Verfiy {}

class VPasswordFaluireState extends Verfiy {
  final String errorMessage ;
  VPasswordFaluireState(this.errorMessage);
}

class VSucssesStateinit extends Verfiy {
  final String msg ;
  VSucssesStateinit(this.msg);
}

