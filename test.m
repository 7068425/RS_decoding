% all_msg = [1 2 3 4 5 6 7];
% all_msg_gf = gf(all_msg, 3);
% 
% % 现在做域内乘法
% c = all_msg_gf(3) * all_msg_gf(4);   % 即 GF(8) 中 3·4
% 结果不是 12，而是按 x^3+x+1 约化后的值（MATLAB 默认用 x^3+x+1）
% 
% % 做域内加法
% s = all_msg_gf(3) + all_msg_gf(5);   % = 3 XOR 5 = 6
% 
% % 生成 RS(7,3) 的生成多项式系数(默认本原多项式为11)
% genpoly = rsgenpoly(7, 3) ;
% 
% rs编码
% msg_poly = gf([1 2 3], 3); % 原始信息
% code = rsenc(msg_poly, 7, 3); % MATLAB 自带的 RS 编码

%rs译码
%decoded = rsdec(code, 7, 3);
% a = gf([1 4 3 0 0 1 3],3);
% decoded = rsdec(a, 7, 3);

%RS编码过程
%除以生成多项式
% m = 3; % GF(8) 域
% g_poly = gf([1 3 1 2 3], m); % 生成多项式
% msg = [1 2 3];
% u = gf([msg, zeros(1, 4)], m); % 信息后补4个0
% 
% [q, r] = deconv(u, g_poly);
% 
% % 因为长度问题，r 前面会有补零，我们需要提取有效余数
% % 具体提取方法取决于补零长度，通常取末尾几位
% remainder = r(end-3:end); % 取最后 4 个元素作为校验位
% 
% % 最终的系统码 = 信息 + 校验位
% code = [msg, remainder.x];

%RS译码过程
%算伴随式，发现不全为 0。
%BM 算法得出错误个数为 2，并算出位置多项式的根。
%钱搜索找到位置
%Forney 算法算出错误值
%修正为正确码字，输出原始信息




