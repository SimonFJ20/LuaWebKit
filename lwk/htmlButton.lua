local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local html =  '<button>%s</button>';
    html = html:format(self.text);
    return html;
end

function module:init_HtmlButton(text)
    return {
        instanceof = {
            'HtmlButtonElement',
            'HtmlElement'
        },
        text = text,
        renderHtml = renderHtml
    };
end

return module;