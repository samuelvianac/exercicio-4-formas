# Exercício 04 - Iluminação Dinâmica

## Descrição
Projeto Godot com iluminação dinâmica onde uma SpotLight3D ilumina um cubo 3D. O cubo tem propriedades de material que podem ser alteradas.

## Controles
- **Clique Esquerdo**: Muda a cor da SpotLight3D
- **Clique Direito**: Alterna entre diferentes configurações de material (Metallic e Roughness)

## Características
- SpotLight3D apontada para o cubo
- 8 cores diferentes para a luz
- 7 configurações de material (Metallic e Roughness)
- Cubo em rotação contínua para melhor visualização
- Detecção de clique no cubo

## Propriedades do Material Testadas
- **Metallic**: Controla o quão "metálico" o material parece (0-1)
- **Roughness**: Controla a rugosidade/difusão do material (0-1)

## Como usar
1. Execute o projeto no Godot
2. Clique com botão esquerdo no cubo para mudar a cor da luz
3. Clique com botão direito para testar diferentes materiais
4. Observe como a luz interage com diferentes valores de Metallic e Roughness

## Estrutura
- `CuboIluminado.gd`: Script que controla a luz e material
- `IluminacaoDinamica.tscn`: Cena principal com cubo e luz
