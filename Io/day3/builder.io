Builder := Object clone
Builder cnt := 0
Builder tabOut := method(
    tab := "   "
    if(self cnt == 1, return)
    for (i, 3, self cnt, 
        write(tab)
    )
)
Builder forward := method(
    
    self cnt = self cnt + 1
    tabOut(cnt)
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        self cnt = self cnt + 1
        content := self doMessage(arg)
        if(content type == "Sequence", self tabOut writeln(content))
        self cnt = self cnt - 1
    )
    tabOut(cnt)
    writeln("</", call message name, ">")
    self cnt = self cnt - 1
)
Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))