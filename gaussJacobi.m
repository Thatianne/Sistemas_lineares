function resultado = gaussJacobi(sistema, erro)
disp('********** Gauss-Jacobi **********');
[i, j] = size(sistema);
solucoes = zeros(1, i);
menorErro = realmax;
cont = 0;
while menorErro > erro    
    solucoesAnterior = solucoes;
    solucoesAtual = solucoes;
    for m=1:i
        vet = ([sistema(m, 1:m-1) sistema(m, m+1:i)] .* [solucoesAtual(1, 1:m-1) solucoesAtual(1, m+1:i) ]);        
        somatorio = sum(vet);       
        solucoes(m) = (sistema(m, j) - somatorio)/sistema(m, m);        
    end    
    erros = solucoes - solucoesAnterior;
    menorErro = max(abs(erros));
    disp(solucoes);
    if cont > 100
        break;
    end
    cont = cont + 1;
end
resultado = solucoes;
end