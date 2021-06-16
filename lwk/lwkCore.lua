local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function writeToFile(html, filename)
    print('Creating ./dist/ folder');
    os.execute('mkdir dist');
    local file = io.open('dist/' .. filename, 'w');
    if (not file) then
        error('WriteFileException');
    end
    file:write(html);
    file:close();
end

function module:exportString(htmlDoc)
    lwkUtils:checkInstanceof(htmlDoc, 'HtmlDocument');
    local body = htmlDoc:renderHtml();
    local html = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>%s</title></head>%s</html>';
    html = html:format(htmlDoc.title, body);
    return html;
end

function module:export(htmlDoc, filename)
    local html = module:exportString(htmlDoc);
    writeToFile(html, filename);
    return true;
end

function module:addChild(parent, child)
    if (not parent.children) then
        return false;
    end
    table.insert(parent.children, child);
    return true;
end

function module:addChildren(parent, ...)
    if (not parent.children) then
        return false;
    end
    for _, child in ipairs({...}) do
        table.insert(parent.children, child);
    end
    return true;
end

return module;