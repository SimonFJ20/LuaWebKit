local lwk = require('lwk');

local document = lwk:init_Document('Test');
local header1 = lwk:init_HeaderElement('Made from within Lua')
local button1 = lwk:init_ButtonElement('This is a button')

local div = lwk:init_DivElement();
local header2 = lwk:init_HeaderElement('Inside div')
local button2 = lwk:init_ButtonElement('Bitlar dib notign wong')

lwk:addChildren(div, header2, button2);

lwk:addChild(document, header1);
lwk:addChild(document, button1);
lwk:addChild(document, div);

lwk:importCss(document, 'style.css');
lwk:export(document, 'index.html');



