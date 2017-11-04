function gauss(matrizAumentada)    
    [i, j] = size(matrizAumentada);
    matrizGauss = matrizAumentada;
    %Transformar em uma matriza triangular superior equivalente
    for m = 1:i-1
        for n = m+1:i
            multiplicador = matrizGauss(n, m)/matrizGauss(m, m);
            linha = matrizGauss(n, :);                
            matrizGauss(n, :) = linha - (multiplicador * matrizGauss(m, :));                                
        end
            disp(matrizGauss);
    end
    %Encontrar raízes
    raizes = ones(1, i);    
    for m=i:-1:1
        vet = (matrizGauss(m, m:j-1) .* raizes(1, m:j-1));           
        %somatório
        somatorio = 0;        
        for n=1:(j-m-1)            
            somatorio = somatorio + vet(1, n+1);   
        end        
        raizes(m) = (matrizGauss(m, j) - somatorio)/matrizGauss(m, m);                        
    end
    disp(raizes);
end