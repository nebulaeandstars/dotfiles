syntax keyword rustKeyword async
syntax keyword rustSigil await

" matches 'foo' in '#![abc(foo), def]' and '#[abc(foo)]'
match rustAttributeParameter /\(#!\?\[.*(\n\?\)\zs\([^)]\|\n\)*\ze\(\n\?).*\]\)/
