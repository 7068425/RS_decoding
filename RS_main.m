all_msg=a_msg; %所有可能的信号 (这里假定 a_msg 包含了所有可能的长度为3的输入序列)
all_msg_gf=gf(all_msg,3); %将所有的信号映射到GF域  (伽罗华域，这里3表示 GF(2^3) 域)
all_code_msg=rs_rscode(all_msg_gf) ; %对所有的信号进行RS编码，得到所有正确的编码
msg=rand(5,3);%生成 0~1 之间的小数。
msg=floor(msg*8); %产生随机的5组信号 (生成5x3的矩阵，数值为0-7的整数)
MSG=gf(msg,3); %将产生的5组信号映射到GF域
code=rs_rscode(MSG); %对5组信号进行编码，得到5组正确的RS码
a=zeros(5,5);
b=floor(rand(5,2)*8);
noise=[a,b];% 构造噪声矩阵：前5列为0，后2列为随机数(0-7)
NOISE=gf(noise,3); %产生噪声信号(映射到GF域)
in_msg=code+NOISE; %加噪
for ii = 1:5 %对5组信号进行译码
 new_msg(ii,:) = rs_rrscode(in_msg(ii,:),all_code_msg,all_msg);
end
new_msg;%译码输出
num_same = same(msg,new_msg); %译码正确个数  (比较原始发送的msg和译码后的new_msg)
num =num_same/15;%译码正确率 (总共有5组，每组3个数据，共15个数据点)