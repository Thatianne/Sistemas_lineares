function decomposicaoLU(sistema)
[i, j] = size(sistema);
matrizA = sistema(:, 1:j-1);
[m, n] = size(matrizA);
l = zeros(m, n);
u = zeros(m, n);
for i=1:m
    for j=1:n
        if i>=j
            somatorioL = 0;
            for k=1:j-1
                somatorioL = somatorioL + (l(i, k) * u(k, j));
            end
            l(i, j) = matrizA(i, j) - somatorioL;            
        else
            somatorioU = 0;
            for k=1:i-1
                somatorioU = somatorioU + (l(i, k) * u(k, j));
            end
            u(i, j) = (matrizA(i, j) - somatorioU)/l(i, i);
        end
        if i == j
            u(i, i) = 1;
        end
    end
end
disp(l);
disp(u);
lAumentada = [l sistema(:, 1:j)];
%uAumentada = [u sistema(:, 1:j)];

raizes = ones(1, i);    
for m=i:-1:1              
    vet = (lAumentada(m, m:j-1) .* raizes(1, m:j-1));           
    %somatório
    somatorio = 0;        
    for n=1:(j-m-1)            
        somatorio = somatorio + vet(1, n+1);   
    end        
    raizes(m) = (lAumentada(m, j) - somatorio)/lAumentada(m, m);                        
end
disp(raizes);
    
    