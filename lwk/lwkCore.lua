local lwkUtils = require('lwk.lwkUtils');

local module = {};

local function writeFileToDist(html, filename)
    print('Creating ./dist/ folder');
    os.execute('mkdir dist');
    local file = io.open('dist/' .. filename, 'w');
    if (not file) then
        error('WriteFileException');
    end
    file:write(html);
    file:close();
end

function module:exportString(document)
    lwkUtils:checkInstanceof(document, 'HtmlDocument');
    local html = document:renderHtml();
    return html;
end

function module:export(document, filename)
    local html = module:exportString(document);
    writeFileToDist(html, filename);
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

function module:importCss(document, filename)
    lwkUtils:checkInstanceof(document, 'HtmlDocument');
    table.insert(document.styleImports, filename);
end

function module:setAttribute(element, key, value)
    lwkUtils:checkInstanceof(element, 'HtmlElement');
    element.attributes[key] = value;
end

return module;