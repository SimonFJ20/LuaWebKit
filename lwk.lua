local module = {};
local function addModule(mName)
    local mModule = require(mName);
    for i, v in pairs(mModule) do
        module[i] = v;
    end
end

addModule('lwk/lwkCore');
addModule('lwk/lwkUtils');
addModule('lwk/htmlDoc');
addModule('lwk/htmlButton');
addModule('lwk/htmlHeader');
addModule('lwk/htmlDiv');

return module;