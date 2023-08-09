#!/bin/bash
i3-msg 'workspace 4; exec google-chrome --app="https://app.slack.com/client/"'
sleep 2
i3-msg 'split v'
sleep 2
i3-msg 'exec google-chrome --app="https://calendar.google.com/"'
sleep 2
i3-msg 'split h'
sleep 2
i3-msg 'exec google-chrome --app="https://mail.google.com/"'
