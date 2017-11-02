% Sistemas lineares

% sistema = [1 -5 1 -13 3 16;
%           -5 1 16 -2 -7 7;
%           -17 6 5 -1 4 -14;
%           2 11 -1 -5 -20 3;
%           3 -21 -8 -4 5 -5];

%sistema = [-8 1 -2 -20;
%           2 -6 -1 -38;
%           -3 -1 7 -34];

sistema = [1 4 -2 8;
           2 3 -3 -2;
           -4 6 -1 7];
          
[i,j] = size(sistema);
matrizA = sistema(:, 1:j-1);
detSistema = det(matrizA);
pivotamento(sistema);
if detSistema ~= 0
    if i == j-1        
        sistema = pivotamento(sistema);        
        %Eliminação de Gauss
        gauss(sistema);
        
        %Fatoração ou decomposição LU
        decomposicaoLU(sistema);
    else
        fprintf('Sistema impossível de resolver');
    end
else
    fprintf('O sistema não possui solução única');
end