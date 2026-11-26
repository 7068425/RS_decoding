function new_msg=rs_rrscode(in_msg,all_code_msg,all_msg)
new_msg=rs_interpret(in_msg,all_code_msg,all_msg);
return;
end

%常规方法：接收方收到信号后，会计算"伴随式（Syndrome）"。如果信号没出错，信号多项式一定能被生成多项式整除（余数为 0）；
%如果有余数，说明出错了，并根据余数去定位错误。

%本代码是查表法