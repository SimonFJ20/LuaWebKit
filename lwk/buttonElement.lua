local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local attributes = lwkUtils:renderAttributes(self);
    local html =  '<button%s>%s</button>';
    html = html:format(attributes, self.text);
    return html;
end

function module:init_ButtonElement(text)
    return {
        instanceof = {
            'HtmlButtonElement',
            'HtmlElement'
        },
        renderHtml = renderHtml,
        attributes = {},
        text = text
    };
end

return module;