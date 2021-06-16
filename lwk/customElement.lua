
local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local attributes = lwkUtils:renderAttributes(self);
    if (self.children) then
        local innerHtml = lwkUtils:renderInnerHtml(self);
        local html =  '<%s%s>%s</%s>';
        html = html:format(self.tagname, attributes, innerHtml, self.tagname);
        return html;
    else
        local html =  '<%s%s/>';
        html = html:format(self.tagname, attributes);
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
        attributes = {},
        tagname = tagname
    };
    if (isParent) then
        htmlCustom.children = {};
    end
    return htmlCustom;
end

return module;
