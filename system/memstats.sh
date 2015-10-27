#!/bin/sh

ps -e -o pid,rss,vsz,cmd | awk '
function fmt(size) {
    if (size > (1024*1024)) {
        return sprintf("%.1fG", size / 1024 / 1024);
    } else if (size > 1024) {
        return sprintf("%.1fM", size / 1024);
    } else {
        return sprintf("%.1fK", size);
    }
}
BEGIN { printf "%6s %6s %6s %s\n","PID","RSS","VSZ","CMD" }
/[0-9]/ { printf "%6d %6s %6s %s\n",$1,fmt($2),fmt($3),$4 }'
