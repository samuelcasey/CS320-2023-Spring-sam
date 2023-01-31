fun fact(x: int): int = 
  if x > 0 then x * fact(x-1) else 1 





fun checkOverflow(N: int): int =
    let
        val result = fact N handle Overflow => 0;
    in
        if result = 0 then N else checkOverflow(N+1)
    end;

checkOverflow 1;