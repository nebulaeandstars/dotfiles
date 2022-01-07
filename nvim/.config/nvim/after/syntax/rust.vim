syntax keyword rustKeyword async

" matches 'foo' in '#![abc(foo), def]' and '#[abc(foo)]'
match rustAttributeParameter /\(#!\?\[.*(\)\zs.*\ze\().*\]\)/
