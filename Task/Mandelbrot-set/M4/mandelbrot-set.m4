divert(-1)
changecom
define(`newline',`
')
define(`leftquote',`[')
define(`rightquote',`]')
changequote(`[',`]')
define([print_char],
[ifelse(
$1,0,[*],
$1,1,[*],
$1,2,[*],
$1,3,[*],
$1,4,[*],
$1,5,[*],
$1,6,[*],
$1,7,[*],
$1,8,[*],
$1,9,[*],
$1,10,[newline],
$1,11,[*],
$1,12,[*],
$1,13,[*],
$1,14,[*],
$1,15,[*],
$1,16,[*],
$1,17,[*],
$1,18,[*],
$1,19,[*],
$1,20,[*],
$1,21,[*],
$1,22,[*],
$1,23,[*],
$1,24,[*],
$1,25,[*],
$1,26,[*],
$1,27,[*],
$1,28,[*],
$1,29,[*],
$1,30,[*],
$1,31,[*],
$1,32,[ ],
$1,33,[!],
$1,34,["],
$1,35,[#],
$1,36,[$],
$1,37,[%],
$1,38,[&],
$1,39,['],
$1,40,[(],
$1,41,[)],
$1,42,[*],
$1,43,[+],
$1,44,[,],
$1,45,[-],
$1,46,[.],
$1,47,[/],
$1,48,[0],
$1,49,[1],
$1,50,[2],
$1,51,[3],
$1,52,[4],
$1,53,[5],
$1,54,[6],
$1,55,[7],
$1,56,[8],
$1,57,[9],
$1,58,[:],
$1,59,[;],
$1,60,[<],
$1,61,[=],
$1,62,[>],
$1,63,[?],
$1,64,[@],
$1,65,[A],
$1,66,[B],
$1,67,[C],
$1,68,[D],
$1,69,[E],
$1,70,[F],
$1,71,[G],
$1,72,[H],
$1,73,[I],
$1,74,[J],
$1,75,[K],
$1,76,[L],
$1,77,[M],
$1,78,[N],
$1,79,[O],
$1,80,[P],
$1,81,[Q],
$1,82,[R],
$1,83,[S],
$1,84,[T],
$1,85,[U],
$1,86,[V],
$1,87,[W],
$1,88,[X],
$1,89,[Y],
$1,90,[Z],
$1,91,[changequote([`],['])leftquote`'changequote(`[',`]')],
$1,92,[\],
$1,93,[rightquote],
$1,94,[^],
$1,95,[_],
$1,96,[`],
$1,97,[a],
$1,98,[b],
$1,99,[c],
$1,100,[d],
$1,101,[e],
$1,102,[f],
$1,103,[g],
$1,104,[h],
$1,105,[i],
$1,106,[j],
$1,107,[k],
$1,108,[l],
$1,109,[m],
$1,110,[n],
$1,111,[o],
$1,112,[p],
$1,113,[q],
$1,114,[r],
$1,115,[s],
$1,116,[t],
$1,117,[u],
$1,118,[v],
$1,119,[w],
$1,120,[x],
$1,121,[y],
$1,122,[z],
$1,123,[{],
$1,124,[|],
$1,125,[}],
$1,126,[~],
[*])])
define([stack_1st],[substr([$1],0,index([$1],[:]))])
define([stack_2nd],[stack_1st(stack_drop([$1]))])
define([stack_drop],[substr([$1],eval(index([$1],[:]) [+ 1]))])
define([stack_drop2],[stack_drop(stack_drop([$1]))])
define([stack_not],[eval(stack_1st([$1]) [== 0]):stack_drop([$1])])
define([stack_neg],[eval([-] stack_1st([$1])):stack_drop([$1])])
define([stack_and],[eval(stack_2nd([$1] [!= 0]) [&&] stack_1st([$1] [!= 0])):stack_drop2([$1])])
define([stack_or],[eval(stack_2nd([$1] [!= 0]) [||] stack_1st([$1] [!= 0])):stack_drop2([$1])])
define([stack_lt],[eval(stack_2nd([$1]) [<] stack_1st([$1])):stack_drop2([$1])])
define([stack_le],[eval(stack_2nd([$1]) [<=] stack_1st([$1])):stack_drop2([$1])])
define([stack_gt],[eval(stack_2nd([$1]) [>] stack_1st([$1])):stack_drop2([$1])])
define([stack_ge],[eval(stack_2nd([$1]) [>=] stack_1st([$1])):stack_drop2([$1])])
define([stack_eq],[eval(stack_2nd([$1]) [==] stack_1st([$1])):stack_drop2([$1])])
define([stack_ne],[eval(stack_2nd([$1]) [!=] stack_1st([$1])):stack_drop2([$1])])
define([stack_add],[eval(stack_2nd([$1]) [+] stack_1st([$1])):stack_drop2([$1])])
define([stack_sub],[eval(stack_2nd([$1]) [-] stack_1st([$1])):stack_drop2([$1])])
define([stack_mul],[eval(stack_2nd([$1]) [*] stack_1st([$1])):stack_drop2([$1])])
define([stack_div],[eval(stack_2nd([$1]) [/] stack_1st([$1])):stack_drop2([$1])])
define([stack_mod],[eval(stack_2nd([$1]) [%] stack_1st([$1])):stack_drop2([$1])])
define([prtc_1st],[print_char(stack_1st([$1]))])
define([prti_1st],[stack_1st([$1])])
define([prts_1st],[print_string(stack_1st([$1]))])
define([store],[define([_tmp1],index([$2],[$1:]))[]substr([$2],0,_tmp1)[$1:$3]define([_tmp2],substr([$2],eval(_tmp1 + len([$1]) [+ 1])))substr(_tmp2,index(_tmp2,[:]))])
define([fetch],[define([_tmp],substr([$2],eval(index([$2],[$1:]) [+] len([$1]) [+ 1])))[]substr(_tmp,0,index(_tmp,[:]))])
define([initial_vars],[var0:0:var1:0:var2:0:var3:0:var4:0:var5:0:var6:0:var7:0:var8:0:var9:0:var10:0:var11:0:var12:0:var13:0:var14:0:])
define([kont0],[kont5([420:$1],[$2])])
define([kont5],[kont6(stack_neg([$1]),[$2])])
define([kont6],[kont11(stack_drop([$1]),store([var0],[$2],stack_1st([$1])))])
define([kont11],[kont16([300:$1],[$2])])
define([kont16],[kont21(stack_drop([$1]),store([var1],[$2],stack_1st([$1])))])
define([kont21],[kont26([300:$1],[$2])])
define([kont26],[kont31(stack_drop([$1]),store([var2],[$2],stack_1st([$1])))])
define([kont31],[kont36([300:$1],[$2])])
define([kont36],[kont37(stack_neg([$1]),[$2])])
define([kont37],[kont42(stack_drop([$1]),store([var3],[$2],stack_1st([$1])))])
define([kont42],[kont47([7:$1],[$2])])
define([kont47],[kont52(stack_drop([$1]),store([var4],[$2],stack_1st([$1])))])
define([kont52],[kont57([15:$1],[$2])])
define([kont57],[kont62(stack_drop([$1]),store([var5],[$2],stack_1st([$1])))])
define([kont62],[kont67([200:$1],[$2])])
define([kont67],[kont72(stack_drop([$1]),store([var6],[$2],stack_1st([$1])))])
define([kont72],[kont77(fetch([var2],[$2])[:$1],[$2])])
define([kont77],[kont82(stack_drop([$1]),store([var7],[$2],stack_1st([$1])))])
define([kont82],[kont87(fetch([var7],[$2])[:$1],[$2])])
define([kont87],[kont92(fetch([var3],[$2])[:$1],[$2])])
define([kont92],[kont93(stack_gt([$1]),[$2])])
define([kont93],[ifelse(eval(stack_1st([$1]) [== 0]),1,[kont423(stack_drop([$1]),[$2])],[kont98(stack_drop([$1]),[$2])])])
define([kont98],[kont103(fetch([var0],[$2])[:$1],[$2])])
define([kont103],[kont108(stack_drop([$1]),store([var8],[$2],stack_1st([$1])))])
define([kont108],[kont113(fetch([var8],[$2])[:$1],[$2])])
define([kont113],[kont118(fetch([var1],[$2])[:$1],[$2])])
define([kont118],[kont119(stack_lt([$1]),[$2])])
define([kont119],[ifelse(eval(stack_1st([$1]) [== 0]),1,[kont396(stack_drop([$1]),[$2])],[kont124(stack_drop([$1]),[$2])])])
define([kont124],[kont129([0:$1],[$2])])
define([kont129],[kont134(stack_drop([$1]),store([var9],[$2],stack_1st([$1])))])
define([kont134],[kont139([0:$1],[$2])])
define([kont139],[kont144(stack_drop([$1]),store([var10],[$2],stack_1st([$1])))])
define([kont144],[kont149([32:$1],[$2])])
define([kont149],[kont154(stack_drop([$1]),store([var11],[$2],stack_1st([$1])))])
define([kont154],[kont159([0:$1],[$2])])
define([kont159],[kont164(stack_drop([$1]),store([var12],[$2],stack_1st([$1])))])
define([kont164],[kont169(fetch([var12],[$2])[:$1],[$2])])
define([kont169],[kont174(fetch([var6],[$2])[:$1],[$2])])
define([kont174],[kont175(stack_lt([$1]),[$2])])
define([kont175],[ifelse(eval(stack_1st([$1]) [== 0]),1,[kont369(stack_drop([$1]),[$2])],[kont180(stack_drop([$1]),[$2])])])
define([kont180],[kont185(fetch([var10],[$2])[:$1],[$2])])
define([kont185],[kont190(fetch([var10],[$2])[:$1],[$2])])
define([kont190],[kont191(stack_mul([$1]),[$2])])
define([kont191],[kont196([200:$1],[$2])])
define([kont196],[kont197(stack_div([$1]),[$2])])
define([kont197],[kont202(stack_drop([$1]),store([var13],[$2],stack_1st([$1])))])
define([kont202],[kont207(fetch([var9],[$2])[:$1],[$2])])
define([kont207],[kont212(fetch([var9],[$2])[:$1],[$2])])
define([kont212],[kont213(stack_mul([$1]),[$2])])
define([kont213],[kont218([200:$1],[$2])])
define([kont218],[kont219(stack_div([$1]),[$2])])
define([kont219],[kont224(stack_drop([$1]),store([var14],[$2],stack_1st([$1])))])
define([kont224],[kont229(fetch([var13],[$2])[:$1],[$2])])
define([kont229],[kont234(fetch([var14],[$2])[:$1],[$2])])
define([kont234],[kont235(stack_add([$1]),[$2])])
define([kont235],[kont240([800:$1],[$2])])
define([kont240],[kont241(stack_gt([$1]),[$2])])
define([kont241],[ifelse(eval(stack_1st([$1]) [== 0]),1,[kont298(stack_drop([$1]),[$2])],[kont246(stack_drop([$1]),[$2])])])
define([kont246],[kont251([48:$1],[$2])])
define([kont251],[kont256(fetch([var12],[$2])[:$1],[$2])])
define([kont256],[kont257(stack_add([$1]),[$2])])
define([kont257],[kont262(stack_drop([$1]),store([var11],[$2],stack_1st([$1])))])
define([kont262],[kont267(fetch([var12],[$2])[:$1],[$2])])
define([kont267],[kont272([9:$1],[$2])])
define([kont272],[kont273(stack_gt([$1]),[$2])])
define([kont273],[ifelse(eval(stack_1st([$1]) [== 0]),1,[kont288(stack_drop([$1]),[$2])],[kont278(stack_drop([$1]),[$2])])])
define([kont278],[kont283([64:$1],[$2])])
define([kont283],[kont288(stack_drop([$1]),store([var11],[$2],stack_1st([$1])))])
define([kont288],[kont293(fetch([var6],[$2])[:$1],[$2])])
define([kont293],[kont298(stack_drop([$1]),store([var12],[$2],stack_1st([$1])))])
define([kont298],[kont303(fetch([var10],[$2])[:$1],[$2])])
define([kont303],[kont308(fetch([var9],[$2])[:$1],[$2])])
define([kont308],[kont309(stack_mul([$1]),[$2])])
define([kont309],[kont314([100:$1],[$2])])
define([kont314],[kont315(stack_div([$1]),[$2])])
define([kont315],[kont320(fetch([var7],[$2])[:$1],[$2])])
define([kont320],[kont321(stack_add([$1]),[$2])])
define([kont321],[kont326(stack_drop([$1]),store([var9],[$2],stack_1st([$1])))])
define([kont326],[kont331(fetch([var13],[$2])[:$1],[$2])])
define([kont331],[kont336(fetch([var14],[$2])[:$1],[$2])])
define([kont336],[kont337(stack_sub([$1]),[$2])])
define([kont337],[kont342(fetch([var8],[$2])[:$1],[$2])])
define([kont342],[kont343(stack_add([$1]),[$2])])
define([kont343],[kont348(stack_drop([$1]),store([var10],[$2],stack_1st([$1])))])
define([kont348],[kont353(fetch([var12],[$2])[:$1],[$2])])
define([kont353],[kont358([1:$1],[$2])])
define([kont358],[kont359(stack_add([$1]),[$2])])
define([kont359],[kont364(stack_drop([$1]),store([var12],[$2],stack_1st([$1])))])
define([kont364],[kont164([$1],[$2])])
define([kont369],[kont374(fetch([var11],[$2])[:$1],[$2])])
define([kont374],[prtc_1st([$1])[]kont375(stack_drop([$1]),[$2])])
define([kont375],[kont380(fetch([var8],[$2])[:$1],[$2])])
define([kont380],[kont385(fetch([var4],[$2])[:$1],[$2])])
define([kont385],[kont386(stack_add([$1]),[$2])])
define([kont386],[kont391(stack_drop([$1]),store([var8],[$2],stack_1st([$1])))])
define([kont391],[kont108([$1],[$2])])
define([kont396],[kont401([10:$1],[$2])])
define([kont401],[prtc_1st([$1])[]kont402(stack_drop([$1]),[$2])])
define([kont402],[kont407(fetch([var7],[$2])[:$1],[$2])])
define([kont407],[kont412(fetch([var5],[$2])[:$1],[$2])])
define([kont412],[kont413(stack_sub([$1]),[$2])])
define([kont413],[kont418(stack_drop([$1]),store([var7],[$2],stack_1st([$1])))])
define([kont418],[kont82([$1],[$2])])
define([kont423],[])
divert[]dnl
kont0([stack-bottom],initial_vars)[]dnl
