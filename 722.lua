print("\n 数据结构")
a = {} --new table
for i =1,100 do
    a[i] = 0
end
print(#a)
a = {}
for i =-5,10 do
    a[i] = 0
end
print(#a) --长度10为1~10

--矩阵
mt = {} --3 x 4
for i=1,3 do
    mt[i] = {}
    for j=1,4 do
        mt[i][j] = 1
    end
end

--链表
print("\n 链表")
list = nil
list = {next = list, value = 2}
rear = list

list = {next = list, value = 1}
rear.next = {next = nil, value = 3};rear = rear.next
rear.next = {next = nil, value = 4};rear = rear.next
local l = list
while l do
    print(l.value)
    l = l.next
end



--队列
print("\n 队列")
---[[
local List = { }

function List.init(list)
    list.first = 0
    list.last = -1
    --return {first = 0, last = -1}
end
List:init()

function List.pushfirst(list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end
function List.pushlast(list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end
function List.popfirst(list)
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil       --为了允许垃圾收集
    list.last = last -1
    return value
end
function List.poplast(list)
    local last = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last] = nil        --为了允许垃圾收集
    list.last = last-1
    return value
end
function List.print(self)
    for i=self.first, self.last do
        print(self[i])
    end
end

List.pushlast(List, 1)
List.pushlast(List, 2)
List:pushlast(3)
--List:poplast()
List:print()

--[[
local List = {}

function List.print(list)
  print(list.First)
end

List["First"] = "200 OK"
List["Second"] = "404 Bad Request"

List.print(List)
]]

local t = {"hello ","world","!"}
local s = table.concat(t)
print(s)

b = 700             -- GT['b'] = 700
local a = 9         -- 设置在栈上

function p1()       -- GT['p1'] = Closure B
    m = 90          -- GT['m'] = 90
    local n = 8     -- 设置在栈上
    print(a)        -- 数据来自upval
    print(b)        -- 数据来自GT
end

function p2()       -- GT['p2'] = Closure C
    print(m)        -- 数据来自GT
    print(n)        -- nil
end
p1()
p2()