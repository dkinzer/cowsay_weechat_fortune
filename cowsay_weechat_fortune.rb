#!ruby

# @file
# Cowsay and Fortune mashup as a Weechat (IRC client) plugin.

def weechat_init
  Weechat.register("cowsay_fortune", "dkinzer", "1.0", "GPL3", "Test script",    "", "")

  Weechat.hook_command('cowsay_fortune', "Cow Says Fortune",
                       "[mood] | [message]", "mood : 'Mood of cow' | message: an optional fortune you supply",    "", "cowsay_fortune", "")

  return Weechat::WEECHAT_RC_OK
end

def cowsay_fortune data, buffer, arguments
  fortune = get_cow_fortune arguments
  Weechat.print(buffer, fortune)
  return Weechat::WEECHAT_RC_OK
end

def get_cow_fortune arguments
  cow_mood = get_cow_mood arguments
  `cowsay #{cow_mood} $(fortune)`
end


def get_cow_mood arguments
  cow_moods = ['-b', '-d', '-g', '-t', '-w', '-y', '']
  cow_moods.sample
end