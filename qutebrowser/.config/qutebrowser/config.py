import subprocess

# don't load default settings
config.load_autoconfig(False)

# homepage
c.url.start_pages = ["about:blank"]
c.url.default_page = "about:blank"

# fork new tabs to the background, rather than following them
c.tabs.background = True

# only show the tab bar if there are multiple tabs
c.tabs.show = 'multiple'

# only show the statusbar if in a mode
c.statusbar.show = 'in-mode'

# various delays
c.tabs.show_switching_delay = 2000
c.messages.timeout = 5000
c.keyhint.delay = 0

# default text editor
c.editor.command = ['$TERMINAL', '-e', '$EDITOR', '{file}']
c.editor.encoding = 'utf-8'

# use the new ad-blocker
c.content.blocking.method = 'both'

# allow desktop notifications
c.content.notifications = true

# default character encoding
c.content.default_encoding = 'utf-8'

# downloads location
c.downloads.location.directory = "~/dl"
c.downloads.location.suggestion = 'both'

# keybindings
config.bind('<Ctrl-=>', 'zoom-in')
config.bind('<Ctrl-->', 'zoom-out')
# config.bind('J', 'tab-prev')
# config.bind('K', 'tab-next')

config.bind(',ht', 'set tabs.show switching')
config.bind(',st', 'set tabs.show multiple')
config.bind(',hs', 'set statusbar.show in-mode')
config.bind(',ss', 'set statusbar.show always')
config.bind(',p',  'open --private')
config.bind(',l',  'set colors.webpage.bg #ffffd8')
config.bind(',d',  'set colors.webpage.bg #2d2d2d')

###########################################################################
## FONTS # FONTS # FONTS # FONTS # FONTS # FONTS # FONTS # FONTS # FONTS ##
###########################################################################

# defaults
c.fonts.default_family = "DejaVu Sans Mono"
c.fonts.default_size = "10pt"

# custom
# c.fonts.tabs.selected = "12pt default_family"
# c.fonts.tabs.unselected = "12pt default_family"


c.tabs.padding = {'top': 1, 'bottom': 3, 'left': 5, 'right': 5}


###########################################################################
## COLORS # COLORS # COLORS # COLORS # COLORS # COLORS # COLORS # COLORS ##
###########################################################################

# color variables
cream = "#ffffd8"
mauve = "#ffd8ff"
sky = "#d8ffff"

black = subprocess.run(['get-xcolor', '0'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
red = subprocess.run(['get-xcolor', '1'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
green = subprocess.run(['get-xcolor', '2'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
yellow = subprocess.run(['get-xcolor', '3'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
blue = subprocess.run(['get-xcolor', '4'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
magenta = subprocess.run(['get-xcolor', '5'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
cyan = subprocess.run(['get-xcolor', '6'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
white = subprocess.run(['get-xcolor', '7'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightblack = subprocess.run(['get-xcolor', '8'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightred = subprocess.run(['get-xcolor', '9'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightgreen = subprocess.run(['get-xcolor', '10'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightyellow = subprocess.run(['get-xcolor', '11'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightblue = subprocess.run(['get-xcolor', '12'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightmagenta = subprocess.run(['get-xcolor', '13'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightcyan = subprocess.run(['get-xcolor', '14'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]
brightwhite = subprocess.run(['get-xcolor', '15'],
        stdout=subprocess.PIPE).stdout.decode().split('\n')[0]


# COMPLETION WIDGET # COMPLETION WIDGET # COMPLETION WIDGET #

## completion widget category headers
c.colors.completion.category.bg = black
c.colors.completion.category.border.bottom = brightblue
c.colors.completion.category.border.top = black
c.colors.completion.category.fg = brightwhite

# completion widget rows
c.colors.completion.even.bg = black
c.colors.completion.odd.bg = black

# completion widget columns
c.colors.completion.fg = [brightwhite, brightwhite, brightwhite]

# selected completion item
c.colors.completion.item.selected.bg = black
c.colors.completion.item.selected.border.bottom = brightgreen
c.colors.completion.item.selected.border.top = black
c.colors.completion.item.selected.fg = brightwhite

# completion matches
c.colors.completion.item.selected.match.fg = brightgreen
c.colors.completion.match.fg = brightblue

# widget scrollbar
c.colors.completion.scrollbar.bg = black
c.colors.completion.scrollbar.fg = brightwhite


# CONTEXT MENU # CONTEXT MENU # CONTEXT MENU # CONTEXT MENU # CONTEXT MENU #

# context menu
c.colors.contextmenu.menu.bg = black
c.colors.contextmenu.menu.fg = brightwhite

# context menu selection
c.colors.contextmenu.selected.bg = brightblack
c.colors.contextmenu.selected.fg = brightwhite

# context menu disabled items
c.colors.contextmenu.disabled.bg = black
c.colors.contextmenu.disabled.fg = brightblack


# DOWNLOADS # DOWNLOADS # DOWNLOADS # DOWNLOADS # DOWNLOADS # DOWNLOADS #

# download bar
c.colors.downloads.bar.bg = black
c.colors.downloads.start.bg = blue
c.colors.downloads.start.fg = black
c.colors.downloads.stop.bg = brightgreen
c.colors.downloads.stop.fg = black
c.colors.downloads.system.bg = 'rgb'
c.colors.downloads.system.fg = 'rgb'

# download bar with errors
c.colors.downloads.error.bg = red
c.colors.downloads.error.fg = brightwhite


# HINTS # HINTS # HINTS # HINTS # HINTS # HINTS # HINTS # HINTS # HINTS #

# hints
c.colors.hints.bg = cyan
c.colors.hints.fg = black
c.hints.border = "2px solid " + blue
c.colors.hints.match.fg = brightblack

## keyhint widget
c.colors.keyhint.bg = 'rgba(10, 10, 10, 80%)'
c.colors.keyhint.fg = brightwhite

# keys to complete chain in keyhint widget
c.colors.keyhint.suffix.fg = brightblue


# MESSAGES # MESSAGES # MESSAGES # MESSAGES # MESSAGES # MESSAGES #

# error messages
c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.error.fg = brightwhite

# info messages
c.colors.messages.info.bg = black
c.colors.messages.info.border = black
c.colors.messages.info.fg = brightwhite

c.colors.messages.warning.bg = brightyellow
c.colors.messages.warning.border = brightyellow
c.colors.messages.warning.fg = black


# PROMPTS # PROMPTS # PROMPTS # PROMPTS # PROMPTS # PROMPTS # PROMPTS #

# prompts
c.colors.prompts.bg = black
c.colors.prompts.border = "1px solid " + brightblack
c.colors.prompts.fg = brightwhite

## selected item in filename prompts
c.colors.prompts.selected.bg = brightblack


# STATUSBAR # STATUSBAR # STATUSBAR # STATUSBAR # STATUSBAR # STATUSBAR #

# statusbar in normal mode
c.colors.statusbar.normal.bg = black
c.colors.statusbar.normal.fg = brightwhite

# statusbar in caret mode
c.colors.statusbar.caret.bg = blue
c.colors.statusbar.caret.fg = brightwhite

# statusbar in caret mode with selection
c.colors.statusbar.caret.selection.bg = blue
c.colors.statusbar.caret.selection.fg = brightwhite

# statusbar in command mode
c.colors.statusbar.command.bg = black
c.colors.statusbar.command.fg = brightwhite

# statusbar in command mode with private browsing
c.colors.statusbar.command.private.bg = magenta
c.colors.statusbar.command.private.fg = brightwhite

# statusbar in insert mode
c.colors.statusbar.insert.bg = green
c.colors.statusbar.insert.fg = brightwhite

# statusbar in passthrough mode
c.colors.statusbar.passthrough.bg = cyan
c.colors.statusbar.passthrough.fg = brightwhite

# statusbar in private browsing mode
c.colors.statusbar.private.bg = magenta
c.colors.statusbar.private.fg = brightwhite

# statusbar url
c.colors.statusbar.url.fg = brightwhite # while loading
c.colors.statusbar.url.success.http.fg = brightyellow # loaded http
c.colors.statusbar.url.success.https.fg = brightgreen # loaded https

c.colors.statusbar.url.hover.fg = brightcyan # hovering over links
c.colors.statusbar.url.error.fg = brightred # with error
c.colors.statusbar.url.warn.fg = yellow # with warning

# progress bar
c.colors.statusbar.progress.bg = brightwhite


# TABS # TABS # TABS # TABS # TABS # TABS # TABS # TABS # TABS # TABS #

# tab bar
c.colors.tabs.bar.bg = brightblack

# tab indicator
c.colors.tabs.indicator.start = blue
c.colors.tabs.indicator.stop = brightgreen
c.colors.tabs.indicator.system = 'rgb'

c.colors.tabs.indicator.error = red

# unselected tabs
c.colors.tabs.even.bg = "#3e3e3e"
c.colors.tabs.even.fg = brightwhite
c.colors.tabs.odd.bg = "#3e3e3e"
c.colors.tabs.odd.fg = brightwhite

# pinned unselected tabs
c.colors.tabs.pinned.even.bg = brightblack
c.colors.tabs.pinned.even.fg = brightcyan
c.colors.tabs.pinned.odd.bg = brightblack
c.colors.tabs.pinned.odd.fg = brightcyan

# selected tabs
c.colors.tabs.selected.even.bg = black
c.colors.tabs.selected.even.fg = brightwhite
c.colors.tabs.selected.odd.bg = black
c.colors.tabs.selected.odd.fg = brightwhite

# pinned selected tabs
c.colors.tabs.pinned.selected.even.bg = black
c.colors.tabs.pinned.selected.even.fg = brightcyan
c.colors.tabs.pinned.selected.odd.bg = black
c.colors.tabs.pinned.selected.odd.fg = brightwhite


# OTHER # OTHER # OTHER # OTHER # OTHER # OTHER # OTHER # OTHER # OTHER #

# default background color for webpages if unset
c.colors.webpage.bg = black

# force `prefers-color-scheme: dark` for websites.
c.colors.webpage.preferred_color_scheme = "dark"

# enable dark theme stuff
# c.colors.webpage.darkmode.enabled = True
