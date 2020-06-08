### okami methods
treble_patch(){
  ## Check if the installed rom has treble enabled.
  treble=false
  device=$(file_getprop $home/anykernel.sh device.name1)
  for i in /system/build.prop /vendor/build.prop /system/system/build.prop /system/vendor/build.prop /system/system/vendor/build.prop; do
    if [ "$(file_getprop $i ro.treble.enabled)" == "true" ]; then
      treble=true
      break;
    fi
  done

  ui_print "Patching zImage for [${device}]...";
  if [ "$treble" == "true" ]; then
          ui_print "==========[ TREBLE ]===========";
          cat zImage ${device}-treble > zImage_2;
  else
          ui_print "========[ NON TREBLE ]=========";
          cat zImage ${device} > zImage_2;
  fi;

  mv zImage_2 zImage
}
