
local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    if (self.children) then
        local innerHtml = lwkUtils:renderInnerHtml(self);
        local html =  '<%s>%s</%s>';
        html = html:format(self.tagname, innerHtml, self.tagname);
        return html;
    else
        local html =  '<%s/>';
        html = html:format(self.tagname);
        return html;
    end
end

function module:init_CustomElement(tagname, isParent)
    local htmlCustom = {
        instanceof = {
            'HtmlCustomElement',
            'HtmlElement'
        },
        renderHtml = renderHtml,
        tagname = tagname
    };
    if (isParent) then
        htmlCustom.children = {};
    end
    return htmlCustom;
end

return module;
