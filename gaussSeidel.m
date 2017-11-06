function resultado = gaussSeidel(sistema, erro)
disp('********** Gauss-Seidel **********');
[i, j] = size(sistema);
solucoes = zeros(1, i);
solucoesAtual = zeros(1, i);
maiorErro = realmax;
cont = 0;
while maiorErro > erro    
    solucoesAnterior = solucoes;    
    for m=1:i
        vet = ([sistema(m, 1:m-1) sistema(m, m+1:i)] .* [solucoesAtual(1, 1:m-1) solucoesAtual(1, m+1:i) ]);        
        somatorio = sum(vet);       
        solucoesAtual(m) = (sistema(m, j) - somatorio)/sistema(m, m);        
    end
    solucoes = solucoesAtual;
    erros = solucoes - solucoesAnterior;
    maiorErro = max(abs(erros));
    disp(solucoes);
    if cont > 15
        break;
    end
    cont = cont + 1;
end
resultado = solucoes;
end