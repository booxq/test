print("new student")

function fact(n)
    if n==0 then
        return 1
    else 
        return n * fact(n-1)
    end
end
--print("please enter a number:")
--a = io.read("*number") --?
print(fact(5))

a = 1 b = a * 2
print(a+b)

---[[
function norm(x,y)
    return (x^2 + y^2)^0.5
end
--]]

--[=[
--[[注释
function twice (x)
    return 2*x
end
--]]
--if 1 then print(1) end
print()
--]=]

--全局变量
print(x)--初始为空
x = 10
print(x)

--类型
print(type(type))
print(type(type(print)))
print(type(xx))
x = print
x(10)
x(x)

--print("123" + "1")--ptint 124.0 不建议依赖强制转换
--print("123" + 1)  --

--[[
line = io.read()
n = tonumber(line)
if n==nil then
    error(line .. " is not avalid number")
else
    print(n)
end
--]]

--print(#"123456789")--长度

--table
a = {}
a["x"] = 10
a[10] = "x"
print(a[a[10]])
print(a.x) -- a.x==a["x"]!=a[x]
--[[
for i=1,5 do
    a[i]=i
end

a[#a] = nil -- 删除末尾
for i=1,#a do
    print(a[i])
end

a[#a+1] = 9  --末尾添加
for i=1,#a do
    print(a[i])
end
--]]

--[[语句
print("a,b,c赋值")
a,b,c = 1

do--程序块
    local a,b,c = 11,22,33
    print(a,b,c)
end

print(a,b,c)
a,b,c = 1,2,3,4
print(a,b,c)
]]
print("泛型for")
for i in pairs(a) do print(i) end

--[[
print("break")
for i=1,10 do
    if i>5 then 
        break 
    else 
        print(i)
    end
end
]]



--2020年7月20日
print("2020年7月20日")
--[[function big(i,v)
    while i do
        if i>=v then return end
        print(i)
        i = i + 1
    end 
end 
big(2,7)
]]

--[[
function add(n)
    n = n or 1
    cnt = cnt + n
end
cnt = 0
add()
add(2)
print (cnt)
]]

--h,t = string.find("ajdsgfijasdglkan","f ija")

--多参数返回
function foo()
    return 1,2
end
x,y,z = foo(),foo()
print(x,y,z)
print(foo(),foo())

t = {foo(),foo()}
for i=1,#t do print(t[i]) end

function foon()
    return foo() 
end
print(foon(),foon())

t = {1,2,3,4,5}
function unpack( t,i )
    i = i or 1
    if t[i] then
        return t[i], unpack(t,i+1)
    end
end
print(unpack(t))


--变长参数调用
function more(...)
    --print("calling more:",...)
    local sum = 0
    local a,b,c = ...
    print("a="..a,"b="..b,"c="..c)
    for i,v in ipairs{...} do 
        sum = sum + v
    end
    return sum
end
print(more(unpack(t)))

--深入函数
print("--深入函数")
a = {p=print}
a.p("hello!")
a.p = math.sin
sin = print
sin(a.p(1.5707962))
--函数名也是变量
del = function (f,d)
    d = d or 1e-4
    return function(x) return (f(x+d)-f(x))/d end
end
c = del(math.sin)
print(math.cos(1),c(1))

--closure
function Counter()
    local i = 0
    return function ()
        i = i + 1
        return i
    end
end
c1 = Counter()
print(c1())
print(c1())
print(Counter()())
print(Counter()())
c2 = Counter()
print(c2())
print(c2())
print(c1())
print(c2())

--改名，制造安全运行环境

--局部函数
print("--局部函数")
lib = {
    foo = function (x,y) return x + y end,
    goo = function (x,y) return x - y end
}
print(lib.goo(100,1))


--迭代器

--print("--迭代器")
function values (t)
    local i = 0
    return function () i = i +1 ; return t[i] end
end

t= {10,20,30}
iter = values(t)
--print(values(t)())
print(iter())
while true do
    local element = iter()
    if element == nil then break end
    print(element)
end

print("--泛型迭代器")
t= {10,20,30}
for element in values(t) do
    print(element)
end


a = {"one","two","three"}
for i,v in ipairs(a) do 
--    print(i,v)
end

local function iter (a,i)
    i = i + 1
    local v = a[i]
    if v then
        return i,v
    end
end
function Ipairs (a)
    return iter , a,0
end
for i,v in Ipairs(a) do 
    print(i,v)
end

--dofile加载文件
print("编译")
i = 0
f = load("i = i + 1")
f();print(i)


--协同程序
print("\n协同程序")
co = coroutine.create( function() print("hello") end )
print(co)
print(coroutine.resume(co) )
--print(coroutine.status(co) )

co = coroutine.create( function()
    print(coroutine.status(co2))
    for i=3,10 do
        print("co",i)
        --print(coroutine.status(co))
        if i >4 then
            coroutine.yield()
        end
    end
end)

co2 = coroutine.create( function()
    coroutine.resume(co)
    --print(coroutine.status(co2))
end)
coroutine.resume(co2)
--[[
co = coroutine.create (
    function (a,b,c)
        print("co",a,b,c)
    end)
coroutine.resume(co,1,2,3)
]]

co = coroutine.create (
    function(a,b) 
        print(coroutine.yield(a+b,a-b))
    end)
print(coroutine.resume(co,4,5))

--??
co = coroutine.create (
    function() 
        print("co",coroutine.yield())
    end)
coroutine.resume(co)
coroutine.resume(co,4,5)

co = coroutine.create(function()
    return 6,1
end)
print(coroutine.resume(co))

--“管道、过滤器”
print("\n管道过滤器")
--[[
local file = io.open("read.txt","r")

function producer ()
    while true do
        local x = file:read("*n")
        send(x)
    end
end
function consumer ()
    while true do
        local x = receive()
        io.write(x)
    end
end
producer ()
consumer ()
]]


--过滤器
file = io.open("read.txt","r")
function receive (prod)
    local status,value = coroutine.resume( prod )
    return value
end

function send (x)
    coroutine.yield( x )
end
function producer ()
    return coroutine.create(
        function ()
            while true do
                local x = file:read("*line")
                if x==nil then break end 
                send (x)
            end
        end
    )
end
function filter (prod)
    return coroutine.create( function()
        for line = 1,7 do   
            local x = receive(prod)
            x = string.format("%5d %s",line,x)
            send (x)
        end
    end)
end
function consumer (prod)
    while true do
        local x = receive(prod)
        if x==nil then break end
        print(x,"\n")
    end
end
p = producer()
f = filter(p)
consumer(f)


--
print("\n协同程序实现迭代器")
function permgen (a,n)
    n = n or #a
    if n <= 1 then
        printR(a)
    else
        for i=1,n do
            a[n],a[i] = a[i],a[n]
            permgen(a,n-1)
            a[n],a[i] = a[i],a[n]
        end
    end
end
function printR (a)
    for i=1,#a do
        io.write(a[i], " ")
    end
    io.write("\n")
end
permgen( {1,2,3} )

--迭代器
print("\n迭代器")
function permgen (a,n)
    n = n or #a
    if n <= 1 then
        coroutine.yield( a )
    else 
        for i=1,n do
            a[n],a[i] = a[i],a[n]
            permgen(a,n-1)
            a[n],a[i] = a[i],a[n]
        end
    end
end
function permulation (a)
    local co = coroutine.create( function() permgen(a) end )
    --printR (a)
    return function()
        local code, res = coroutine.resume( co )
        --printR(res)
        return res
    end
end
--for p in permulation({"a","b","c"}) do
--    printR(p)
--end
c = permulation({"a","b","c"})
printR(c()) -- b c a
printR(c()) -- c b a
printR(c()) -- c a b


--[[马尔科夫
print("\n马尔科夫")
function insert (index, value)
    local list = statetab[index]
    if list == nil then 
        statetab[index] = {value}
    else 
        list[#list +1 ] = value
    end
end
local file = io.open("helo.txt","r")
function allwords ()
    local line = file:read("*line")--wenjian
    local pos = 1
    return function ()
        while line do
            local s,e = string.find(line,"%w+",pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = file:read("*line") --line
                pos = 1
            end
        end
        return nil
    end
end

function prefix(w1, w2)
    return (w1 .. " " .. w2)
end

local statetab = {}
function insert (index, value)
    local list = statetab[index]
    if list == nil then 
        statetab[index] = {value}
    else   
        list[#list + 1] = value
    end
end

--main p
local N = 2
local MAXGEN = 10000
local NOWORD ="\n"
--构建table
local w1, w2 = NOWORD
for w in allwords() do
    insert(prefix(w1, w2), w)
    w1 = w2; w2 = w
end
insert(prefix(w1, w2), NOWORD)
--生成
w1 = NOWORD; w2 = NOWORD
for i=1,MAXGEN do
    local list = statetab[prefix(w1, w2)]
    local r = math.random(#list)
    local nextword = list[r]
    if nextword == NOWORD then return end
    io.write(nextword, " ")
    w1 = w2; w2 = nextword
end
]]


--2020年7月22日
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

--[[
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
]]



--2020年7月23日
--print("2020年7月23日")
--[[
function serialize (o)
    if type(o) == "number" then
        io.write(o)
    elseif type(o) == "string" then
        io.write(string.format("%q",o))
    elseif type(o) == "table" then
        io.write("{\n")
        for k,v in pairs(o)  do
            io.write("  ", k, " = ")
            serialize(v)
            io.write(",\n")
        end
        io.write("}\n")
    else 
        error("cannot serialize a " .. type(o))
    end
end
serialize{a=12,b='Lua',key='another "word"'}
]]
