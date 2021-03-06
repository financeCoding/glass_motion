import 'dart:html';

import 'package:glass_motion/glass_motion.dart';

void main() {
  GlassMotion glassMotion = new GlassMotion(window);

  int height = 555;
  double headTilt = 0.0;
  int position = 0;

  glassMotion.onMotion.listen((_) =>
    headTilt = headTilt*0.8 + glassMotion.position.pitch*0.2);

  void animate(num highResTime) {
    if(highResTime >= 16) {
      if(headTilt.abs() > 4.0){ // min angle to start tilt
        position -= headTilt/2;
        position = position.clamp(0, height*6);
        window.scrollTo(0, position);
      }
    }
    window.requestAnimationFrame(animate);
  }
  window.requestAnimationFrame(animate);
}