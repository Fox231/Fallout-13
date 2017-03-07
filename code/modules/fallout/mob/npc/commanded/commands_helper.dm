var/list/translit_symbols = list("�" = "a", "�" = "b", "�" = "v", "�" = "g", "�" = "d", "�" = "e", "�" = "yo", "�"= "j", "�" = "z", "�" = "i", \
 "�" = "y", "�" = "k", "�" = "l", "�" = "m", "�" = "n", "�" = "o", "�" = "p", "�" = "r", "�" = "c", "�" = "t", "�" = "y", \
 "�" = "f", "�" = "h", "�" = "tc", "�" = "ch", "�" = "sh", "�" = "sh", "�" = "i", "�" = "e", "�" = "yu", "�" = "ya", \
 "�" = "", "�" = "")
var/static/list/phrases_storage = list("attack" = "���,����,���,����,�����,���", "follow" = "������,���,����,�� ���,� ����,�����,�� ����", \
"stop" = "������,����,����������,����,���������", "stay" = "������,����,�� �����,�� ��������", \
"andrew" = "�����,�����", "bear" = "����,������,�������", "brahmin" = "������,�����", \
"me" = "����,����,�,���", "everyone" = "���,����", "dance" = "����,�����", "defend" = "�����,�����,����,����", \
"legion" = "������", "ncr" = "���", "enemy" = "����", "friend" = "����,����", "pull" = "����,����", "dog" = "����,��,�����")


proc/translit(text)
	return sanitize_simple(text, translit_symbols)

proc/parse_phrase(text, name)
	if(findtext(text,name))
		return 1
	if(name in phrases_storage)
		var/names = phrases_storage[name]
		names = splittext(names,",")
		for(var/N in names)
			if(findtext(text,"[N]"))
				return 1
	var/translit = translit(text)
	if(findtext(translit,name))
		if(phrases_storage[name])
			phrases_storage[name] += ",[translit]"
		else
			phrases_storage[name] = translit
		return 1
	return 0