import 'package:untitled3/cubit/cubitManager.dart';

abstract class newsappstate{}

class InitialFootBallState extends newsappstate{}

class Changebottomstate extends newsappstate{}

class GetScienceDataSuccState extends newsappstate{}

class GetScienceDataErrorState extends newsappstate{}

class loadingScienceDataState extends newsappstate{}

class GetsportsDataSuccState extends newsappstate{}

class GetsportsDataErrorState extends newsappstate{}

class loadingsportsDataState extends newsappstate{}

class GetbuisnessDataSuccState extends newsappstate{}

class GetbuisnessDataErrorState extends newsappstate{}

class loadingbuisnessDataState extends newsappstate{}

class GetbsearchDataSuccState extends newsappstate{}

class GetsearchDataErrorState extends newsappstate{}

class loadingsearchDataState extends newsappstate{}

class Checksearch extends newsappstate{}