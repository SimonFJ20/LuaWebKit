local module = {};
local function addModule(mName)
    local mModule = require(mName);
    for i, v in pairs(mModule) do
        module[i] = v;
    end
end

addModule('lwk/lwkCore');
addModule('lwk/lwkUtils');
addModule('lwk/document');
addModule('lwk/customElement');
addModule('lwk/buttonElement');
addModule('lwk/headerElement');
addModule('lwk/divElement');
addModule('lwk/paragraphElement');

return module;