{ writeShellScript }:

writeShellScript "caffein" ''
  # setup
  STATUS=$(xset -q | grep 'DPMS is' | tail -1 | awk '{print $3;}')

  # Laserwave
  ON="#EEEEEE"
  OFF="#27212E"
  # Nord
  #ON="#eceff4"
  #OFF="#4c566a"


  case $STATUS in
    'Enabled') # we turn it off if its on
      echo "%{F$OFF}%{F-}" > /tmp/caffeine
      xset s off
      xset -dpms
      ;;
    'Disabled')
      echo "%{F$ON}%{F-}" > /tmp/caffeine
      xset s on
      xset +dpms
      ;;
  esac

''
