function pivotamento(sistema)
[i, j] = size(sistema);
%[valores, indices] = max(abs(sistema), [], 2);%�ndice das linhas
m = 0;
for n=1:i-1
    disp('hghg');
    disp(sistema(n:i, 1:j-1));
    [valor, indice] = max(abs(sistema(n:i, 1:j-1)), [], 1);%�ndice das colunas  
    l = indice(n);    
    linha1 = sistema(l + m, :);
    linha2 = sistema(n, :);
    sistema(l + m, :) = linha2;
    sistema(n, :) = linha1;
    m = m + 1;
    disp(sistema);
end
disp(sistema);
disp('****************************');
end