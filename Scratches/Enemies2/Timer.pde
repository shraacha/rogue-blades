class Timer {
  int nSec;

  Timer() {
    nSec = 0;
  }

  void timeKeep() {
    if (frameCount % 60 == 0) {
      nSec ++;
    }
  }
}
