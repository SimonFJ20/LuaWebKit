local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function renderHead(self)
    local head = '<meta charset="UTF-8"><title>%s</title>';
    head = head:format(self.title);
    for _, v in ipairs(self.styleImports) do
        local import = '<link rel="stylesheet" href="%s">';
        import = import:format(v);
        head = head .. import;
    end
    return head;
end

local function renderHtml(self)
    local html = '<!DOCTYPE html><html><head>%s</head><body>%s</body></html>';
    local head = renderHead(self);
    local body = lwkUtils:renderInnerHtml(self);
    html = html:format(head, body);
    return html;
end

function module:init_Document(title)
    return {
        instanceof = {
            'HtmlElement',
            'HtmlDocument'
        },
        children = {},
        styleImports = {},
        title = title,
        renderHtml = renderHtml
    };
end

return module;
