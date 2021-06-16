local lwk = require('lwk');

local htmlDoc = lwk:init_HtmlDoc('Test');
local htmlHeader = lwk:init_HtmlHeader('Made from within Lua')
local htmlButton = lwk:init_HtmlButton('This is a button')

local div = lwk:init_HtmlDiv();
local header2 = lwk:init_HtmlHeader('Inside div')
local button2 = lwk:init_HtmlButton('Bitlar dib notign wong')

lwk:addChildren(div, header2, button2);

lwk:addChild(htmlDoc, htmlHeader);
lwk:addChild(htmlDoc, htmlButton);
lwk:addChild(htmlDoc, div);

lwk:export(htmlDoc, 'index.html');



