Config {

   -- appearance
     font =         "xft:JetBrains Mono:pixelsize=16:antialias=true:hinting=true"
   , bgColor =      "#2E3440"
   , fgColor =      "#ABABAB"
   , position =     Top
   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)
   , template = " %StdinReader% %music%}{ %default:Master%| %battery% | %date% | %kbd% "
