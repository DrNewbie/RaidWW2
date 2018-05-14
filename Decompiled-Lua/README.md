# Raid-WW2-Lua

Issues fixed by hand(present in the repo):

```lua
X.Y = function(self)

end
```

Regex: 
```(\w+)\.(\w+) = function \(self,*\s*```

Replace with: 
```function $1:$2(```


```lua
X.Y = function(...)

end
```

Regex(After you're done with the first issue):
```(\w+)\.(\w+) = function \(*\s*```

Replace with
```function $1.$2(```
