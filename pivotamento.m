function sistemaPivotado = pivotamento(sistema)
[i, j] = size(sistema);
%[valores, indices] = max(abs(sistema), [], 2);%índice das linhas
m = 0;
for n=1:i-1    
    [valor, indice] = max(abs(sistema(n:i, 1:j-1)), [], 1);%índice das colunas  
    l = indice(n);    
    linha1 = sistema(l + m, :);
    linha2 = sistema(n, :);
    sistema(l + m, :) = linha2;
    sistema(n, :) = linha1;
    m = m + 1;   
end
sistemaPivotado = sistema;
end