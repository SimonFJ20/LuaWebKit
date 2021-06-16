local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self, childHtml)
    local innerHtml = lwkUtils:renderInnerHtml(self);
    local html =  '<div>%s</div>';
    html = html:format(innerHtml);
    return html;
end

function module:init_HtmlDiv()
    return {
        instanceof = {
            'HtmlDivElement',
            'HtmlElement'
        },
        children = {},
        renderHtml = renderHtml
    };
end

return module;