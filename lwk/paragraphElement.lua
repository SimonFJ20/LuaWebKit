local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local attributes = lwkUtils:renderAttributes(self);
    local html =  '<p%s>%s</p>';
    html = html:format(attributes, self.text);
    return html;
end

function module:init_ParagraphElement(text)
    return {
        instanceof = {
            'HtmlParagraphElement',
            'HtmlElement'
        },
        renderHtml = renderHtml,
        attributes = {},
        text = text
    };
end

return module;