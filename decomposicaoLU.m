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
[i, j] = size(sistema);
lAumentada = [l sistema(:, j)];
%Raízes l
raizes = ones(1, i);    
for m=1:i    
    vet = (lAumentada(m, 1:m) .* raizes(1, 1:m));    
    somatorio = sum(vet(1, 1:m-1));    
    raizes(m) = (lAumentada(m, j) - somatorio)/lAumentada(m, m);    
end
uAumentada = [u raizes'];
for m=i:-1:1
    vet = (uAumentada(m, m:j-1) .* raizes(1, m:j-1));
    %somatório
    disp('aa****aa');
    disp(vet);
    disp(j);
    disp(m);
    disp('****');
    somatorio = 0;
    
    for n=1:(j-m-1)
        somatorio = somatorio + vet(1, n+1);
    end
    raizes(m) = (uAumentada(m, j) - somatorio)/uAumentada(m, m);
end
disp(raizes);
