1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
my_list_simple = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]

my_list_hard = [
    [],
    [1, [2], 3, 4, [5, 6, 7]],
    [8, 9, 10, 11],
    [12, 13, 14, [[[[15]]]]], []
]


class FlatIterator:

    def __init__(self, multi_list):

        self.multi_list = multi_list  # список с воложенными списками

    def __iter__(self):
        self.multi_list_iter = iter(self.multi_list)
        self.nested_list = []  # вложенный список с элементами
        self.nested_list_cursor = -1
        return self

    def __next__(self):
        self.nested_list_cursor += 1
        if len(self.nested_list) == self.nested_list_cursor:
            self.nested_list = None
            self.nested_list_cursor = 0
            while not self.nested_list:
                self.nested_list = next(self.multi_list_iter)
                #  если  список пустой, то получаем следующий
                #  если списки закончаться, получим stop iteration

        return self.nested_list[self.nested_list_cursor]


# второй способ для ниндзя итераторов
from itertools import chain


class FlatIteratorEasyWay:

    def __init__(self, multi_list):
        self.multi_list = multi_list

    def __iter__(self):
        return chain.from_iterable(self.multi_list)


def flat_generator(my_list):
    for sub_list in my_list:
        for item in sub_list:
            yield item


class FlatIteratorV2:

    def __init__(self, multi_list):
        self.multi_list = multi_list

    def __iter__(self):
        self.iterators_stack = [iter(self.multi_list)]  # стэк иетраторовр
        return self

    def __next__(self):
        while self.iterators_stack:  # пока в стеке есть итераторы
            try:
                current_element = next(self.iterators_stack[-1])
                #  пытаемся получить следующий элемент
            except StopIteration:
                self.iterators_stack.pop()
                continue
            if isinstance(current_element, list):
                # если следующий элемент оказался списком, то
                # добавляем его итератор в стек
                self.iterators_stack.append(iter(current_element))
            else:
                # если элемент не список, то просто возвращаем его
                return current_element
        raise StopIteration




def flat_generator_v2(multi_list):
    for item in multi_list:
        if isinstance(item, list):
            # если элемент списка оказывается списком то оборачиваем в этот же генератор
            # такой прием называется рекурсия
            for sub_item in flat_generator_v2(item):
                yield sub_item
        else:
            yield item


print('Задача 1')
for item in FlatIterator(my_list_simple):
    print(item)
print('*' * 25)

print('Задача 2')
for item in flat_generator(my_list_simple):
    print(item)
print('*' * 25)

print('Задача 3')
for item in FlatIteratorV2(my_list_hard):
    print(item)
print('*' * 25)

print('Задача 4')
for item in flat_generator_v2(my_list_hard):
    print(item)
print('*' * 25)