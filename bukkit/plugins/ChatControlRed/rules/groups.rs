# -----------------------------------------------------------------------------------------------
# This file stores groups. Groups are simply operators you can reuse multiple times in rules,
# so that you can apply the same blocking strategy to 100s of swear words without copy-pasting
# the operators into each rule.
#
# Groups support all operators you would typically use on rules except:
# ignore type
#
# For help, see https://github.com/kangarko/ChatControl-Red/wiki/Rules
# -----------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------
# The group used by rules that catch domains/IPs as advertisement.
# -----------------------------------------------------------------------------------------

group advertisement

# Ignore players with the permission below.
ignore perm chatcontrol.bypass.ad

# Do not filter ads in the commands below.
ignore command /brush|/auction|/auc|/register|/reg|/login|l

# Ignore WorldEdit
ignore command //

then warn {warn_prefix} Please do not advertise other websites or IP addresses.

# Notify players with "chatcontrol.notify.ad" permission.
# 1) First part after "then notify" is the permission players need to see the second part.
# 2) The second part is the message itself or a chat format.
then notify chatcontrol.notify.ad ad-info

then deny

# -----------------------------------------------------------------------------------------
# The group used by groups for curse words.
# -----------------------------------------------------------------------------------------

group swear

# Ignore players with the permission below.
ignore perm chatcontrol.bypass.swear

# Do not filter swears in the commands below.
ignore command /brush|/auction|/auc|/register|/reg|/login|l

# Ignore WorldEdit
ignore command //

then warn {warn_prefix} Swearing is prohibited on this server.

# Notify players with "chatcontrol.notify.ad" permission.
# 1) First part after "then notify" is the permission players need to see the second part.
# 2) The second part is the message itself or a chat format.
then notify chatcontrol.notify.swear &8[&7Swear&8] &7{player}: &f{original_message}

# What the matching part of the message should be replaced to?
# If you specify "@prolong " before and then one letter only, it will automatically
# duplicate the letter to fit length of the matched word.
then replace @prolong *

# Or, you can comment the line above and uncomment this one to secretly
# remove the message from other players but the sender, so he thinks it was sent
#then deny silently
