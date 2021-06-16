
local module = {};

function module:checkInstanceof(object, ...)
    if (object.instanceof) then
        local includes = false;
        local index = 1;
        for _, instanceof in ipairs({...}) do
            for i, v in ipairs(object.instanceof) do
                if (v == instanceof) then
                    includes = true;
                    index = i;
                end
            end
        end
        if (not includes) then
            error('Expected HtmlButtonElement got ' .. object.instanceof[index]);
        end
    else
        error('Expected HtmlButtonElement got ' .. type(object));
    end
end

function module:renderInnerHtml(node)
    module:checkInstanceof(node, 'HtmlElement', 'HtmlDocument');
    local innerHtml = '';
    for _, v in ipairs(node.children) do
        innerHtml = innerHtml .. v:renderHtml();
    end
    return innerHtml;
end

function module:renderAttributes(node)
    module:checkInstanceof(node, 'HtmlElement');
    local attributes = '';
    for i, v in pairs(node.attributes) do
        local attribute = ' %s="%s"';
        attribute = attribute:format(i, v);
        attributes = attributes .. attribute;
    end
    return attributes;
end

return module;
