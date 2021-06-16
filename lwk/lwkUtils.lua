
local module = {};

function module:checkInstanceof(instance, instanceof)
    if (instance.instanceof) then
        local includes = false;
        for _, v in ipairs(instance.instanceof) do
            if (v == instanceof) then
                includes = true;
            end
        end
        if (not includes) then
            error('Expected HtmlButtonElement got ' + instance.instanceof[1]);
        end
    else
        error('Expected HtmlButtonElement got ' + type(instance));
    end
end

function module:renderInnerHtml(node)
    module:checkInstanceof(node, 'HtmlElement');
    local innerHtml = '';
    for _, v in ipairs(node.children) do
        innerHtml = innerHtml .. v:renderHtml();
    end
    return innerHtml;
end

return module;
