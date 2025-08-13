{ writeShellScript }:

writeShellScript "switch" ''

#!/usr/bin/env fish

pacmd exit
dm-tool switch-to-greeter

''
