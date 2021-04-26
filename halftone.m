%% Projeto 02
% Autor: Marlon da Silva Rogério

%% Referências
% GONZALEZ, R. C., WOODS, R. E. Processamento de Imagens Digitais. Editora Edgard Blucher, ISBN  São Paulo, 2000.
% Halftone, 2021. Disponível em: <https://en.wikipedia.org/wiki/Halftone>. Acesso  em: 25 de abr. de 2021.
% Support MathWorks, 2021. Disponível em: <https://www.mathworks.com/help/>. Acesso  em: 25 de abr. de 2021.

%% Parte 01
% (1) Definir e Formalizar
% 1.1 Implementar um algoritmo ‘halftoning’ utilizando a técnica de Thresholding (limiarização) fazer de forma simples.
% 1.2 Aplicar a uma imagem escala de cinza.

close all; clear; clc;

% leitura e redimencionamento da imagem
img = imread('ufac.jpeg');
img = imresize(img, [328 226]);
imshow(img)

%% Halftoning
% Halftoning (Meio-tom) é a técnica reprográfica que simula imagens em tons contínuos por meio 
% do uso de pontos, variando em tamanho ou espaçamento, gerando assim um efeito 
% de gradiente. Halftoning também pode ser usado para se referir especificamente 
% à imagem produzida por esse processo. <//en.wikipedia.org>

pontos_linhas = [];
pontos_colunas = [];

for linha = 1:328
  pontos_linhas = [];
  for coluna = 1:226 
    ponto = img(linha, coluna);
    if ponto >= 0 && ponto < 32
      matriz_half = [ 0 0 0; 
                      0 0 0; 
                      0 0 0 ];
    elseif ponto >= 32 && ponto < 64
      matriz_half = [ 1 0 0; 
                      0 0 1; 
                      0 1 0 ];
    elseif ponto >= 64 && ponto < 128
      matriz_half = [ 1 1 1; 
                      1 0 1; 
                      1 1 0 ];
    elseif ponto >= 128 && ponto < 256
      matriz_half = [ 1 1 1 ; 
                      1 1 1 ; 
                      1 1 1 ];
    endif
    pontos_linhas = [pontos_linhas matriz_half];
  endfor
  pontos_colunas = [pontos_colunas; pontos_linhas];  
endfor

figure 
imshow(pontos_colunas)


%% Valores de Referência 
% A submatriz assumiu os valores para escala de cinza do halftone conforme imagem 
% abaixo:
% 0 2 6 0 

grayscale_halftone = imread('grayscale.png');
figure
imshow(grayscale_halftone)






