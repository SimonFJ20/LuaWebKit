local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local attributes = lwkUtils:renderAttributes(self);
    local html =  '<h%s%s>%s</h%s>';
    html = html:format(self.size, attributes, self.text, self.size);
    return html;
end

function module:init_HeaderElement(text, size)
    return {
        instanceof = {
            'HtmlDivElement',
            'HtmlElement'
        },
        renderHtml = renderHtml,
        attributes = {},
        size = size or 1,
        text = text
    };
end

return module;