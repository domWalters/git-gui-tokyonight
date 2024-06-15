#!/usr/bin/env tclsh

proc style_during_apply_config {} {
    set colour_dark_black #1a1b26
    set colour_black #24283b
    set colour_light_black #414868
    set colour_white #a9b1d6
        variable colors
        array set colors {
            -frame          "#24283b"
            -text           "#a9b1d6"
            -window         "#24283b"
            -alternate      "#24283b"
            -activebg       "#24283b"
            -troughbg       "#24283b"
            -selectbg       "#414868"
            -selectfg       "#a9b1d6"
            -disabledfg     "#a9b1d6"
            -indicator      "#9ece6a"
            -altindicator   "#f7768e"
        }
    ttk::style configure "." \
        -font               TkDefaultFont \
        -background         $colors(-frame) \
        -foreground         $colors(-text) \
        -bordercolor        $colour_light_black \
        -selectbackground   $colors(-selectbg) \
        -selectforeground   $colors(-selectfg) \
        -troughcolor        $colors(-troughbg) \
        -indicatorcolor     $colors(-indicator) \
        -highlightcolor     $colors(-indicator) \
        -highlightthickness 0 \
        -borderwidth        0 \
        -insertwidth        0 \
        -focuswidth         0 \
        -lightcolor         $colour_light_black \
        -darkcolor          $colour_light_black \
        -relief             flat

    ttk::style map "." -background \
        [list disabled $colors(-frame) active $colors(-activebg)]
    ttk::style map "." -foreground \
        [list disabled $colors(-disabledfg)]

    ttk::style map "." -highlightcolor {focus black}

    option add *Text.Foreground $colour_white interactive

    ttk::style configure Sash -sashrelief flat -sashthickness 0

    ttk::style configure TButton \
        -anchor center \
        -padding "3m 1m" \
        -relief ridge \
        -shiftrelief 1 \
        -borderwidth 0 \
        -bordercolor $colour_light_black \
        -lightcolor $colour_light_black \
        -darkcolor $colour_light_black \
        -background $colour_dark_black \
        -highlightthickness 9 \
        -highlightcolor $colour_light_black \
        -highlightbackground $colour_light_black
    ttk::style map TButton -relief {{!disabled pressed} sunken}
    ttk::style map TButton -background [list active $colour_light_black]

    ttk::style configure TCheckbutton \
        -background $colour_black \
        -indicatorbackground $colour_dark_black \
        -indicatorcolor $colour_dark_black \
        -indicatorrelief flat \
        -indicatormargin {0 1.5p 3p 1.5p} \
        -borderwidth 1
    ttk::style map TCheckbutton \
        -indicatorcolor [list \
            readonly $colour_dark_black \
            {active !selected} $colour_light_black \
            disabled $colour_dark_black \
            pressed $colour_light_black \
            alternate $colors(-altindicator) \
            selected $colors(-indicator)]

    ttk::style configure TRadiobutton \
        -indicatorrelief flat \
        -indicatormargin {0 1.5p 3p 1.5p} \
        -background $colour_black \
        -indicatorbackground $colour_dark_black \
        -indicatorcolor $colour_dark_black
    ttk::style map TRadiobutton \
        -indicatorcolor [list \
            readonly $colour_dark_black \
            {active !selected} $colour_light_black \
            disabled $colour_dark_black \
            pressed $colour_light_black \
            alternate $colors(-altindicator) \
            selected $colors(-indicator)]

    ttk::style configure TMenubutton \
        -relief flat \
        -indicatormargin {3.75p 0} \
        -padding {3m 1m}
    ttk::style configure TMenubutton.Separator \
        -background $colour_white

    ttk::style configure TEntry \
        -padding            1 \
        -font               TkTextFont \
        -fieldbackground    $colour_dark_black \
        -background         $colour_dark_black \
        -foreground         $colors(-text) \
        -insertcolor        $colors(-text) \
        -borderwidth        0

    ttk::style element create Combobox.downarrow from default
    ttk::style configure TCombobox \
        -padding 1 \
        -arrowsize 9p \
        -borderwidth 0 \
        -fieldbackground $colour_dark_black \
        -background $colour_dark_black \
        -foreground $colors(-text) \
        -insertcolor $colors(-text) \
        -arrowcolor $colors(-text)
    ttk::style map TCombobox -fieldbackground \
        [list readonly $colour_dark_black disabled $colour_dark_black]
    ttk::style configure ComboboxPopdownFrame \
        -borderwidth 0 \
        -fieldbackground $colour_dark_black \
        -background $colour_dark_black
    option add *TCombobox*Listbox.background $colors(-frame)
    option add *TCombobox*Listbox.foreground $colors(-text)
    option add *TCombobox*Listbox.selectBackground $colour_light_black
    option add *TCombobox*Listbox.selectForeground $colors(-text)
    option add *Listbox.background $colors(-frame)
    option add *Listbox.foreground $colors(-text)
    option add *Listbox.selectBackground $colour_light_black
    option add *Listbox.selectForeground $colors(-text)

    ttk::style element create Spinbox.uparrow from default
    ttk::style element create Spinbox.downarrow from default
    ttk::style configure TSpinbox \
        -arrowsize 7.5p \
        -padding {1.5p 0 7.5p 0} \
        -fieldbackground $colour_dark_black \
        -background $colour_dark_black \
        -foreground $colors(-text) \
        -insertcolor $colors(-text) \
        -arrowcolor $colors(-text) \
        -borderwidth        0

    # ttk::style configure TLabelframe -borderwidth 2 -relief groove 

    ttk::style configure TScrollbar -arrowsize 9p -width 9p -background $colour_light_black -borderwidth 0
    ttk::style map TScrollbar -background [list {active !disabled} $colour_light_black disabled $colors(-frame)]
    ttk::style map TScrollbar -arrowcolor [list !disabled $colors(-text) disabled $colors(-frame)]
    ttk::style map TScrollbar -width [list disabled 0]

    ttk::style configure TScale -sliderrelief raised \
        -sliderlength 22.5p -sliderthickness 11.25p
    ttk::style map TScale -sliderrelief {{pressed !disabled} sunken}

    ttk::style configure TProgressbar -background SteelBlue \
        -barsize 22.5p -thickness 11.25p

    ttk::style configure TNotebook.Tab \
        -padding {3m 1m} \
        -background $colors(-troughbg) \
        -focussolid 1
    ttk::style map TNotebook.Tab -background [list selected $colors(-frame)]

    # Treeview:
    ttk::style configure Heading -font TkHeadingFont -relief raised
    ttk::style configure Item -indicatorsize 9p \
        -indicatormargins {1.5p 1.5p 3p 1.5p}
    ttk::style configure Treeview -background $colors(-window) \
        -stripedbackground $colors(-alternate) -indent 15p
    ttk::style configure Treeview.Separator \
        -background $colors(-alternate)
    ttk::style map Treeview \
        -background [list disabled $colors(-frame)\
                selected $colors(-selectbg)] \
        -foreground [list disabled $colors(-disabledfg) \
                selected $colors(-selectfg)]

    #
    # Toolbar buttons:
    #
    ttk::style configure Toolbutton -padding 1.5p -relief flat -shiftrelief 2
    ttk::style map Toolbutton -relief \
        {disabled flat selected flat pressed flat active flat}
    ttk::style map Toolbutton -background \
        [list pressed $colors(-troughbg)  active $colors(-activebg)]

    ttk::style configure Sash \
        -sashthickness 4.5p -sashpad 1.5 -handlesize 6p -handlepad 6p
}

proc style_during_load_window_state {} {
    set colour_dark_black #1a1b26
    set colour_black #24283b
    set colour_white #a9b1d6
    set colour_green #9ece6a
    set colour_red #f7768e
    set colour_yellow #e0af68
    set colour_blue #bb9af7
    .mbar configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.repository configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.edit configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.branch configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.commit configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.merge configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.remote configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.tools configure \
        -background $colour_dark_black \
        -borderwidth 0
    .mbar.help configure \
        -background $colour_dark_black \
        -borderwidth 0
    .vpane.files.index.list configure \
        -borderwidth 0 \
        -background $colour_black \
        -highlightbackground $colour_black \
        -highlightthickness 0
    .vpane.files.index.title configure \
        -background $colour_green
    .vpane.files.workdir.list configure \
        -borderwidth 0 \
        -background $colour_black \
        -highlightbackground $colour_black \
        -highlightthickness 0
    .vpane.files.workdir.title configure \
        -background $colour_red
    .vpane.lower.diff.body.t configure \
        -borderwidth 0 \
        -background $colour_black \
        -highlightbackground $colour_black \
        -highlightthickness 0
    .vpane.lower.diff.header.status configure \
        -background $colour_yellow
    .vpane.lower.diff.header.file configure \
        -background $colour_yellow
    .vpane.lower.diff.header.path configure \
	    -foreground black \
        -background $colour_yellow
    .vpane.lower.commarea.buffer.frame.t configure \
        -borderwidth 0 \
        -background $colour_dark_black \
        -highlightbackground $colour_dark_black \
        -highlightthickness 0
}
