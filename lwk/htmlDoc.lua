local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHtml(self)
    local innerHtml = lwkUtils:renderInnerHtml(self);
    local html =  '<body>%s</body>';
    html = html:format(innerHtml);
    return html;
end

function module:init_HtmlDoc(title)
    return {
        instanceof = {
            'HtmlElement',
            'HtmlDoc'
        },
        children = {},
        title = title,
        renderHtml = renderHtml
    };
end

return module;
