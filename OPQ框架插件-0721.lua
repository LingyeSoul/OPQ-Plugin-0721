local log = require("log")
local Api = require("coreApi")
local json = require("json")
local botoy = require("Plugins/lib/botoy")
local http = botoy.http
local log = botoy.log
--By：泠夜Soul


ReceiveGroupMsg = botoy.group(function(CurrentQQ, data, action)
     allow=getallow()
       if CurrentQQ==data.FromUserId then
           else
           if allow:find(data.FromGroupId) then
        
     if data.MsgType == "AtMsg" then
if data.Content:find "0721菜单" or data.Content:find "0721帮助" then
         menu =  "0721 Menu \n"..
      "1.0721命令：先(At机器人)再+ 0721 + {执行，嘲讽}\n"..
      "2.施法材料命令：施法材料\n"..
      "3.来一瓶命令：先(At机器人)再+ 来一瓶\n"
   .."PS：请无视指令空格，发生错误（无响应,被拦截）很正常（有些消息内容会过于逆天），请勿重复发送命令！！！\nBy：泠夜Soul"
     action:sendGroupText(data.FromGroupId,menu)
         end
    if data.Content:find "来一瓶" then
         log.info("\n正在发送")
     action:sendGroupUrlPic(data.FromGroupId, [[https://gchat.qpic.cn/gchatpic_new/0/0-0-28A04A3AB81D656526F4D64445508852/0]], data.FromNickName.."，你要的一瓶")
    end
    
    if data.Content:find "0721执行" then
        cact=getrandomact()
         src =  "你正在："..cact
     action:replyGroupMsg(data.FromGroupId,src, data.MsgSeq, data.MsgTime,data.FromUserId,data.Content:match[[Content":"(.-)"]])
    end
    
     end

	if string.find(data.Content, "施法材料") == 1  then
                    log.info("\n开始拉取图片Url")
local setu_json = setu(1, 0)
                local img_url = setu_json["url"]
             log.info("\n"..img_url.."By：泠夜Soul")
                if num==1 then
                    action:sendGroupText(data.FromGroupId,"施法材料链接："..img_url.."\n防止逆天不出施法材料~")
                    else
                  action:sendGroupUrlPic(data.FromGroupId, img_url,"运气不错呢，抽中了可以发的施法材料！")
               end
                flag=false
                end
else
    
end

end
	return 1
end)

function setu(num, r)
    local f, _ = io.open('./Plugins/data/setu.json', "r")
    if r == 1 then
        f, _ = io.open('./Plugins/data/setu_r18.json', "r")
    end
    local content = f:read("*all")
    f:close()
    local setu_data = json.decode(content)
    if num == 1 then
        math.randomseed(os.time())
        setu_json = setu_data[math.random(1, #setu_data)]
    else
        setu_json = {}
        for i = 1, num, 1 do
            math.randomseed(os.time()*i)
            setu_json[i] = setu_data[math.random(1, #setu_data)]["url"]
        end
    end
    return setu_json
end

function getrandomact()
    local data={
        '开导，然后给群友导了300克',
        '开祷',
        '自摸',
        '自扣，然后给群友扣了一瓶',
        '使用桌角'
    }
    local num=math.random(1,#data)
    local string=data[num]
    return string
    end