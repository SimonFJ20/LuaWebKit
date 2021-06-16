local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local innerHtml = lwkUtils:renderInnerHtml(self);
    local html =  '<div>%s</div>';
    html = html:format(innerHtml);
    return html;
end

function module:init_DivElement()
    return {
        instanceof = {
            'HtmlDivElement',
            'HtmlElement'
        },
        renderHtml = renderHtml,
        children = {},
        attributes = {}
    };
end

return module;