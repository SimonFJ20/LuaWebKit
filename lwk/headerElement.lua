local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local html =  '<h%s>%s</h%s>';
    html = html:format(self.size, self.text, self.size);
    return html;
end

function module:init_HeaderElement(text, size)
    return {
        instanceof = {
            'HtmlDivElement',
            'HtmlElement'
        },
        size = size or 1,
        text = text,
        renderHtml = renderHtml
    };
end

return module;