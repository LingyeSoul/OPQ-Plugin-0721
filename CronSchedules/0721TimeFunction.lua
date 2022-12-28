local Api = require("coreApi")
local json = require("json")
local botoy = require("Plugins/lib/botoy")
local http = botoy.http
local log = botoy.log
GroupId=12131  --要发送的群聊
function Task0721(CurrentQQ, task)
     action = botoy.new_action(CurrentQQ)
    log.info("\n0721提醒正在发送")
     action:sendGroupUrlPic(GroupId, [[https://gchat.qpic.cn/gchatpic_new/0/0-0-05903D4D9D8C615DE45A52FE00BB9490/0]])
   return 1 --返回值为任意整数
end