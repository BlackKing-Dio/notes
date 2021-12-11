function Split(szFullString, szSeparator)

   local nFindStartIndex = 1

   local nSplitIndex = 1

   local nSplitArray = {}

   while true do

   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)

   if not nFindLastIndex then

   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))

   break

   end

   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)

   nFindStartIndex = nFindLastIndex + string.len(szSeparator)

   nSplitIndex = nSplitIndex + 1

end

return nSplitArray

end



function split(arr,tag)

  local list = Split(arr,tag)

  for _,i in pairs(list) do

    return i

  end

end



用法:

        local IP_WHITE_RULE = Split(config_white_ip,",")

        --ngx.say(IP_WHITE_RULE)

        local WHITE_IP = get_client_ip()

        --ngx.say(WHITE_IP)

        if IP_WHITE_RULE ~= nil then

            for _,rule in pairs(IP_WHITE_RULE) do

                --ngx.say(rule.."  dd  "..WHITE_IP)

                if rule ~= "" and rulematch(WHITE_IP,rule,"jo") then

                    log_record('White_IP',ngx.var_request_uri,"_","_")

                    return true

                end

            end

        end